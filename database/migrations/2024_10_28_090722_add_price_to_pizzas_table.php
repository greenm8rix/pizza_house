<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddPriceToPizzasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    // lesson 14
    public function up()
    {
        Schema::table('pizzas', function (Blueprint $table) {
            $table->integer('price');
        });
    }

    public function down()
    {
        Schema::table('pizzas', function (Blueprint $table) {
            $table->dropColumn('price');
        });
    }
}
