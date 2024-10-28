{{-- lesson 7 --}}
@extends('layouts.layout')

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
                @foreach ($pizzas as $pizza)
    @if ($loop->first)
        <span>First in the loop</span>
    @endif
    <div>{{ $pizza['type'] }}</div>
    @if ($loop->last)
        <span>Last in the loop</span>
    @endif
@endforeach

            </div>
        </div>
        {{-- lesson 4/5/6 ends here --}}
 {{-- lesson 15--}}
    <h2>Database Pizzas</h2>
    <ul>
        @foreach ($pizzasFromDB as $pizzaDB)
            <li>{{ $pizzaDB->type }} - {{ $pizzaDB->base }} - ${{ $pizzaDB->price }}</li>
        @endforeach
    </ul>
