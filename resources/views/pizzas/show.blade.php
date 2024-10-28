{{-- lesson 7 --}}
{{-- @extends('layouts.layout') --}}
{{-- lesson 25 --}}
@extends('layouts.app')
@section('content')
<div class="content">
    <div class="title m-b-md">
        Pizza Details<br>
    </div>

    {{-- lesson 17 --}}
    <h1>Order for {{ $pizza->name }}</h1>
    <p>Type: {{ $pizza->type }}</p>
    <p>Base: {{ $pizza->base }}</p>
    <p>Price: ${{ $pizza->price }}</p>
    {{-- lesson 22 --}}
    <h2>Extra Toppings:</h2>
    <ul>
        @if(!empty($pizza->toppings))
            @foreach($pizza->toppings as $topping)
                <li>{{ $topping }}</li>
            @endforeach
        @else
            <li>No extra toppings</li>
        @endif
    </ul>
    <form action="{{ route('pizzas.destroy', $pizza->id) }}" method="POST">
        @csrf
        @method('DELETE')
        <button type="submit" onclick="return confirm('Are you sure you want to complete this order?')">Complete order</button>
    </form>
    <a href="/pizza" class="back">← Back to all pizzas</a>
</div>
@endsection
