<?php

namespace App;
// use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
class Pizza extends Model
{
    //
    // use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['type', 'base', 'price', 'name','toppings'];
    protected $casts = [
        'toppings' => 'array', // lesson 21
    ];
}
