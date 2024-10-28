{{-- lesson 7 --}}
@extends('layouts.app')
@section('content')

            <div class="content">
                <div class="title m-b-md">
                    Pizza House <br>
                    Malta's best Pizza House
                </div>
                <div class="button-group">
                    <a href="{{ route('pizzas.create') }}">Order Now!</a>
                </div>


            </div>
        </div>

@endsection
