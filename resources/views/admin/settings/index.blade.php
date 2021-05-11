@extends('adminlte::page')

@section('title', 'Configurações Do Site')

@section('content_header')
    <h1>Configurações Do Site</h1>
@endsection

@section('content')
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                <h5><i class="icon fas fa-ban"></i>Ocorrreu Um Erro</h5>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    @if (session('warning'))
        <div class="alert alert-success">
            {{ session('warning') }}
        </div>
    @endif

    <div class="card">
        <div class="card-body">
            <form class="form-horizontal" action="{{ route('settings.save') }}" method="post">
                @method('PUT')
                @csrf

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Título Do Site</label>
                    <div class="col-sm-10">
                        <input type="text" name="title" value="{{ $settings['title'] }}" class="form-control @error('name') is-invalid @enderror">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Subtítulo Do Site</label>
                    <div class="col-sm-10">
                        <input type="text" name="subtitle" value="{{ $settings['subtitle'] }}" class="form-control @error('name') is-invalid @enderror">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">E-mail</label>
                    <div class="col-sm-10">
                        <input type="email" name="email" value="{{ $settings['email'] }}" class="form-control @error('name') is-invalid @enderror">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Cor De Fundo</label>
                    <div class="col-sm-10">
                        <input type="color" name="bgcolor" value="{{ $settings['bgcolor'] }}" class="form-control" style="width: 70px">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Cor Do Texto</label>
                    <div class="col-sm-10">
                        <input type="color" name="textcolor" value="{{ $settings['textcolor'] }}" class="form-control" style="width: 70px">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 control-label"></label>
                    <div class="col-sm-10">
                        <input type="submit" value="Salvar" class="btn btn-success">
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection
