<?php

use Illuminate\Database\Seeder;
use App\Pizza;
class PizzaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(Pizza::class, 20)->create(); 
    }
}
