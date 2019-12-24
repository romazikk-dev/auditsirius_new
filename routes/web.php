<?php

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

// Route::get('/', function () {
//     return view('welcome');
// });

Auth::routes(['register' => false]);
// Auth::routes();

// Route::get('/logout', 'Auth\LoginController@logout')->name('logout');

Route::group(['middleware' => 'auth'], function(){
    Route::get('/home', 'Dashboard\HomeController@index')->name('home');

    // Route::get('/logout', 'Auth\LoginController@logout')->middleware(['RedirectIfAuthenticated'])->name('logout');

    Route::get('/dash/messages', 'Dashboard\MessageController@index')->name('messages.index');
    Route::get('/dash/messages/create', 'Dashboard\MessageController@create')->name('messages.create');
    Route::get('/dash/messages/edit/{id}', 'Dashboard\MessageController@edit')->name('messages.edit')->where("id", "[0-9]+");
    Route::get('/dash/messages/show', 'Dashboard\MessageController@show')->name('messages.show');
    Route::get('/dash/messages/destroy', 'Dashboard\MessageController@destroy')->name('messages.destroy');
    Route::get('/dash/messages/{id}', 'Dashboard\MessageController@getOne')->name('messages.get_one')->where("id", "[0-9]+");
});
// Route::get('/dash/messages', 'Dashboard\MessageController@index')->name('messages.index');
// Route::get('/dash/messages/create', 'Dashboard\MessageController@create')->name('messages.create');
// Route::get('/dash/messages/edit/{id}', 'Dashboard\MessageController@edit')->name('messages.edit')->where("id", "[0-9]+");
// Route::get('/dash/messages/show', 'Dashboard\MessageController@show')->name('messages.show');
// Route::get('/dash/messages/destroy', 'Dashboard\MessageController@destroy')->name('messages.destroy');
// Route::get('/dash/messages/{id}', 'Dashboard\MessageController@getOne')->name('messages.get_one')->where("id", "[0-9]+");

Route::get('/services-api', 'ServiceController@index')->name('service.api');
Route::put('/add-message-api', 'MessageController@add')->name('add.message.api');
Route::put('/add-comment-api', 'ApiController@addComment')->name('add.comment.api');


Route::get('/{any}', 'HomeController@index')->where('any', '.*');

Route::any(config('blogetc.blog_prefix', 'blog'), function () {

    return abort(404);

});

// Route::group(['prefix' => config('blogetc.blog_prefix', 'blog')], function () {

    //     return abort(404);

    // });


