@extends('layouts.app')

@section('title', 'Catalogo de Recetas')

@section('content')
    <h1>Catalogo de Recetas</h1>

    <table>
        <thead>
            <tr>
                <th>Titulo</th>
                <th>Categoria</th>
                <th>Tiempo de preparacion</th>
                <th>Chef</th>
            </tr>
        </thead>
        <tbody>
            @forelse ($recipes as $recipe)
                <tr>
                    <td>{{ $recipe->title }}</td>
                    <td>{{ $recipe->category }}</td>
                    <td>{{ $recipe->preparation_time }} minutos</td>
                    <td>{{ $recipe->chef->name }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="4">No hay recetas registradas.</td>
                </tr>
            @endforelse
        </tbody>
    </table>

    <style>
        h1 {
            margin-bottom: 24px;
            font-size: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 2px 12px rgba(45, 37, 29, 0.08);
        }

        th,
        td {
            padding: 14px 16px;
            border-bottom: 1px solid #eadfce;
            text-align: left;
        }

        th {
            color: #fff;
            background: #2f6f5e;
        }

        tr:last-child td {
            border-bottom: 0;
        }
    </style>
@endsection
