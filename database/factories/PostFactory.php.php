<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use Faker\Generator as Faker;
use WebDevEtc\BlogEtc\Models\BlogEtcPost;

$factory->define(BlogEtcPost::class, function (Faker $faker) {
    $title = $faker->realText(rand(20,30));

    return [
        //
        'user_id' => 1,
        'slug' => $faker->slug,
        'title' => $title,
        'meta_desc' => $title,
        'post_body' => $faker->paragraph(rand(30,40)),
        'short_description' => $faker->paragraph(1),
        'seo_title' => $title,
        'posted_at' => $faker->dateTime('now'),
    ];
});
