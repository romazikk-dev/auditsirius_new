<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Service;
use Faker\Generator as Faker;

$factory->define(Service::class, function (Faker $faker) {
    $type = ['accounting_support', 'auditing_services', 'consulting'];

    static $position = 1;

    return [
        //
        'title' => $faker->text(25),
        'txt' => $faker->realText(1000),
        'desc_short' => $faker->realText(30),
        'for_whom' => $faker->realText(100),
        'terms' => $faker->realText(100),
        'price' => $faker->numberBetween(100, 2000),
        'type' => $type[rand(0,2)], 
        'position' => $position++,
    ];
});
