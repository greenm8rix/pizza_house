
{{-- lesson 7 --}}
{{-- @extends('layouts.layout') --}}
{{-- lesson 25 --}}
@extends('layouts.app')


@section('content')
<div class="content">
    <div class="title m-b-md">
        Pizza's<br>
    </div>

    {{-- lesson 9 --}}
    <p>Name: {{ $name }}</p>
    <p>Age: {{ $age }}</p>

    <h2>Individual Variables</h2>
    {{-- lesson 4/5/6 --}}
    <p>Types:</p>
    <ul>
        @foreach ($type as $t)
            <li>{{ $t }}</li>
        @endforeach
    </ul>

    <p>Bases:</p>
    <ul>
        @foreach ($base as $b)
            <li>{{ $b }}</li>
        @endforeach
    </ul>

    <p>Prices:</p>
    <ul>
        @foreach ($price as $p)
            <li>${{ $p }}</li>
        @endforeach
    </ul>

    <ul>
        @foreach ($pizzas as $pizza)
            <li>{{ $pizza['type'] }} - {{ $pizza['base'] }} - ${{ $pizza['price'] }}</li>
        @endforeach
    </ul>

    {{-- lesson 15 --}}
    {{-- lesson 18 19 --}}
    <h2>Database Pizzas or all pizza orders</h2>
<ul>
    @foreach ($pizzasFromDB as $pizzaDB)
        <li>
            <a href="{{ route('pizzas.show', ['id' => $pizzaDB->id]) }}">
                {{ $pizzaDB->type }} - {{ $pizzaDB->base }} - ${{ $pizzaDB->price }}
            </a>
        </li>
    @endforeach
</ul>


</div>
@endsection
