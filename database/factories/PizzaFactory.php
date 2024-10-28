<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Pizza;
use Faker\Generator as Faker;

$factory->define(Pizza::class, function (Faker $faker) {
    return [
        'type' => $faker->randomElement(['Hawaiian', 'Pepperoni', 'Margherita', 'BBQ Chicken', 'Veggie']),
        'base' => $faker->randomElement(['thin crust', 'cheesy crust', 'stuffed crust', 'garlic crust']),
        'price' => $faker->randomFloat(2, 5, 20),
        'name' => $faker->name,
    ];
});
