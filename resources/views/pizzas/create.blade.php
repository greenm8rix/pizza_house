{{-- @extends('layouts.layout') --}}
{{-- lesson 25 --}}
@extends('layouts.app')

{{-- //esson 18 19 --}}
@section('content')
<div class="wrapper create-pizza">
    <h1>Create a New Pizza</h1>

    <form action="{{ route('pizzas.store') }}" method="POST">
        @csrf
        <label for="name">Your Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="type">Pizza Type:</label>
        <select id="type" name="type" required onchange="updatePrice()">
            @foreach($types as $type)
                <option value="{{ $type }}">{{ $type }} (${{ $prices[$type] }})</option>
            @endforeach
        </select>

        <label for="base">Base Type:</label>
        <select id="base" name="base" required>
            @foreach($bases as $base)
                <option value="{{ $base }}">{{ $base }}</option>
            @endforeach
        </select>

        <!-- Hidden price field -->
        <input type="hidden" id="price" name="price" value="{{ $prices[$types[0]] }}">

        <fieldset>
            <legend>Extra Toppings</legend>
            <label>
                <input type="checkbox" name="toppings[]" value="mushrooms"> Mushrooms
            </label><br>
            <label>
                <input type="checkbox" name="toppings[]" value="peppers"> Peppers
            </label><br>
            <label>
                <input type="checkbox" name="toppings[]" value="garlic"> Garlic
            </label><br>
            <label>
                <input type="checkbox" name="toppings[]" value="olives"> Olives
            </label><br>
        </fieldset>

        <input type="submit" value="Order Pizza">
    </form>

    <script>
        const prices = @json($prices);

        function updatePrice() {
            const type = document.getElementById('type').value;
            document.getElementById('price').value = prices[type];
        }
    </script>

</div>
@endsection
