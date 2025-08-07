<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\StudentController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('/dashboard-stats', [DashboardController::class, 'stats']);

Route::apiResource('students', StudentController::class);
Route::apiResource('classrooms', StudentController::class);
Route::apiResource('subjects', StudentController::class);