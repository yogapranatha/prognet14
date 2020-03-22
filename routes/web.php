<?php

use Illuminate\Support\Facades\Route;

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


Route::prefix('admin')->group(function(){
    Route::get('/login','AdminController@LoginAdmin');
    Route::get('/register','AdminController@DaftarAdmin');
    Route::post('/login','AdminController@LoginSubmit');
    Route::post('/register','AdminController@DaftarSubmit');
    Route::get('/logout','AdminController@LogoutAdmin');
    Route::get('/dashboard','AdminController@Dashboard')->middleware('loginadmin');
    Route::get('/viewproduct','AdminController@viewproduct');

});


//user
Route::prefix('user')->group(function(){
    Route::get('/login','UserController@LoginUser');
    Route::get('/register','UserController@DaftarUser');
    Route::post('/register','UserController@DaftarSubmit', ['verifikasi' => true]);
    Route::post('/login','UserController@LoginSubmit');
    Route::get('/logout','UserController@Logout');
    Route::get('/dashboard','UserController@Dashboard')->middleware('loginuser');
    Route::get('/verifikasi/{id}','UserController@verifikasiemail');
 });