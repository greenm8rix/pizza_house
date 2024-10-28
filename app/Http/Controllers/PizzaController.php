<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Pizza; // lesson 15
class PizzaController extends Controller
{
    //lesson 11
    public function index() // lesson 16
    {
        $pizza = [
            ['type' => 'Hawaiian', 'base' => 'cheesy crust', 'price' => 10.99],
            ['type' => 'Pepperoni', 'base' => 'thin crust', 'price' => 8.99],
            ['type' => 'Margherita', 'base' => 'stuffed crust', 'price' => 9.99]
        ];
        $type = ['Hawaiian','Pepperoni','Margherita'];
        $base = ['cheesy crust','thin crust','stuffed crust'];
        $price = [10.99,8.99,9.99];
        $name = request('name');
        $age = request('age');

        if (request()->wantsJson()) {
            return response()->json($pizza);
        }

        // lesson 15
        $pizzasFromDB = Pizza::all();
        return view('pizzas.index', [ // lesson 16
            'pizzas' => $pizza,
            'type' => $type,
            'base' => $base,
            'price' => $price,
            'age' => $age,
            'name' => $name,
            'pizzasFromDB' => $pizzasFromDB // lesson 15
        ]);
    }

    public function list() // lesson 16
    {
        return view('pizzas\index'); // lesson 16
    }

    // public function show($id)
    // {
    //     return view('details', ['id' => $id]);
    // }
    public function show($id) // lesson 16
    {
        $pizza = Pizza::findOrFail($id);//17
        return view('pizzas.show', ['pizza' => $pizza]); // lesson 16/17
    }

    public function create(Request  $request) // lesson 16
    {
        $types = ['Margherita', 'Pepperoni', 'Hawaiian', 'Veggie'];
        $bases = ['Cheesy Crust', 'Thin Crust', 'Stuffed Crust', 'Garlic Crust'];
        $prices = [
            'Margherita' => 9.99,
            'Pepperoni' => 12.99,
            'Hawaiian' => 11.99,
            'Veggie' => 10.99,
        ];

        return view('pizzas.create', compact('types', 'bases', 'prices'));
    }

    public function store(Request $request)
{
    $data = $request->validate([
        'name'  => 'required|string|max:255',
        'type'  => 'required|string',
        'base'  => 'required|string',
        'price' => 'required|numeric|min:0',
        'toppings' => 'array', // lesson 21
        'toppings.*' => 'string' // lesson 21
    ]);
    // \Log::info('Form data:', $data);
    Pizza::create($data);
    return redirect('/')->with('success', 'Pizza ordered successfully!');

}
// lesson 22
public function destroy($id)
{

    $pizza = Pizza::findOrFail($id);
    $pizza->delete();


    return redirect()->route('pizzas.index')->with('message', 'Pizza deleted successfully!');
}
}
