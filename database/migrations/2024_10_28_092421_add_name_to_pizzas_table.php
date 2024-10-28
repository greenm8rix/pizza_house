<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddNameToPizzasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('pizzas', function (Blueprint $table) {
            $table->string('name')->after('price')->nullable(); 
        });
    }

    public function down()
    {
        Schema::table('pizzas', function (Blueprint $table) {
            $table->dropColumn('name');
        });
    }
}
