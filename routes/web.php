<?php
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PizzaController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function (){
    return view('welcome');
});
// Route::get('/pizzas' ,function(){
// return view('pizzas');
// });
// //lesson 3
// Route::get('/pizza' ,function(){
//     $data = ['pizzas'];

//     if (request()->wantsJson()) {
//         return response()->json($data);
//     }

//     return implode(', ', $data);
//     });
// //lesson 4/5/6
// Route::get('/pizza' ,function(){
//     $pizza = [
//         ['type' => 'Hawaiian', 'base' => 'cheesy crust', 'price' => 10.99],
//         ['type' => 'Pepperoni', 'base' => 'thin crust', 'price' => 8.99],
//         ['type' => 'Margherita', 'base' => 'stuffed crust', 'price' => 9.99]
//     ];
//     $type = ['Hawaiian','Pepperoni','Margherita'];
//     $base = ['cheesy crust','thin crust','stuffed crust'];
//     $price = [10.99,8.99,9.99];
//     //lesson 9
//     $name =  request('name');
//     $age = request('age');
//     if (request()->wantsJson()) {
//         return response()->json($pizza);
//     }
//     return view('pizzas', [
//         'pizzas' => $pizza,
//         'type' => $type,
//         'base' => $base,
//         'price' => $price,
//         // lesson 9
//         'age' => $age,
//     'name' => $name
//     ]);
// });
// //LESSON 10
// Route::get('/pizza/{id}', function($id) {
//     return view('details', ['id' => $id]);
// });
//lesson 11 18 19
// Route::get('/pizza', [PizzaController::class, 'index'])->name('pizzas.index');
Route::get('/pizzas/create', [PizzaController::class, 'create'])->name('pizzas.create');
// Route::post('/pizzas', [PizzaController::class, 'store'])->name('pizzas.store');
// Route::get('/pizza/{id}', [PizzaController::class, 'show'])->name('pizzas.show');
// Route::delete('/pizzas/{id}', [PizzaController::class, 'destroy'])->name('pizzas.destroy');//lesson 22
//lesson 24
Auth::routes(['register' => false]);
// Lesson 26: Group routes with authentication middleware
Route::middleware(['auth'])->group(function () {
    Route::get('/pizzas/create', [PizzaController::class, 'create'])->name('pizzas.create');
    Route::post('/pizzas', [PizzaController::class, 'store'])->name('pizzas.store');
    Route::get('/pizza/{id}', [PizzaController::class, 'show'])->name('pizzas.show');
    Route::delete('/pizzas/{id}', [PizzaController::class, 'destroy'])->name('pizzas.destroy');
    Route::get('/pizza', [PizzaController::class, 'index'])->name('pizzas.index');
});

Route::get('/home', 'HomeController@index')->name('home');
