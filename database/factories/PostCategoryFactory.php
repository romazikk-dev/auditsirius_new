<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use WebDevEtc\BlogEtc\Models\BlogEtcCategory;
use Faker\Generator as Faker;

$factory->define(BlogEtcCategory::class, function (Faker $faker) {
    $word = $faker->word();

    return [
        //
        'category_name' => $word,
        'category_description' => $word,
        'slug' => $faker->slug,
        'created_by' => 1
    ];
});
