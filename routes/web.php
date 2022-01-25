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


Route::get('/', 'DataController@show');
Route::get('/show', 'DataController@show');
Route::get('/list', 'DataController@list');
Route::get('/detail_trans/{id}', 'DataController@detail_trans');
Route::get('/get_bar', 'DataController@get_bar')->name('bar');
Route::get('/get_pie', 'DataController@get_pie')->name('pie');
Route::get('/get_detail', 'DataController@get_pie')->name('detail');
Route::get('/insert_barang', 'DataController@insert_barang');
Route::get('/insert_penjualan', 'DataController@insert_penjualan');
Route::get('/insert_kategori', 'DataController@insert_kategori');
Route::get('/insert_det_penjualan', 'DataController@insert_det_penjualan');



