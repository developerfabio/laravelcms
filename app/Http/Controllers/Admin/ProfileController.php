<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class ProfileController extends Controller {
    public function __construct() {
        $this->middleware('auth');
    }

    public function index() {
        $loggedId = intval(Auth::id());

        $user = User::find($loggedId);

        if ($user) {
            return view('admin.profile.index', [
                'user' => $user
            ]);
        }

        return redirect()->route('admin');
    }

    public function save(Request $request) {
        $loggedId = intval(Auth::id());
        $user = User::find($loggedId);

        if ($user) {
            $data = $request->only([
                'name',
                'email',
                'password',
                'password_confirmation'
            ]);
            $validator = Validator::make([
                'name' => $data['name'],
                'email' => $data['email']
            ], [
                'name' => 'required|string|max:100',
                'email' => 'required|string|email|max:100'
            ]);

            // 1. Alteração Do Nome
            $user->name = $data['name'];

            // 2. Alteração Do E-mail
            // 2.1 Primeiro, Verificamos Se O E-mail Foi Alterado
            if ($user->email != $data['email']) {
                // 2.2 Verificamos Se O Novo E-mail Já Existe
                $hasEmail = User::where('email', $data['email'])->get();

                // 2.3 Se Não Existir, Nós Alteramos
                if (count($hasEmail) === 0) {
                    $user->email = $data['email'];
                } else {
                    $validator->errors()->add('email', __('validation.unique', [
                        'attribute' => 'email'
                    ]));
                }
            }
            // 3. Alteração Da Senha
            // 3.1 Verifica Se O Usuário Digitou Senha
            if (!empty($data['password'])) {
                // 3.2 Verifica Se A Senha Tem Pelo Menos 4 Dígitos
                if (strlen($data['password']) >= 4) {
                    // 3.3 Verifica Se A Confirmação Está Ok
                    if ($data['password'] === $data['password_confirmation']) {
                        // 3.4 Altera A Senha
                        $user->password = Hash::make($data['password']);
                    } else {
                        $validator->errors()->add('password', __('validation.confirmed', [
                            'attribute' => 'password'
                        ]));
                    }
                } else {
                    $validator->errors()->add('password', __('validation.min.string', [
                        'attribute' => 'senha',
                        'min' => 4
                    ]));
                }
            }

            if (count($validator->errors()) > 0) {
                return redirect()->route('profile', [
                    'user' => $loggedId
                ])->withErrors($validator);
            }

            $user->save();

            return redirect()->route('profile')
                ->with('warning', 'Informações alteradas com sucesso!');
        }

        return redirect()->route('profile');
    }
}
