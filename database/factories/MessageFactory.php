<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Message;
use Faker\Generator as Faker;

$factory->define(Message::class, function (Faker $faker) {
    return [
        'email' => $faker->unique()->safeEmail,
        'text' => $faker->realText(200),
    ];
});
