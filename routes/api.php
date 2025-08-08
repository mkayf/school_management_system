<?php

use App\Http\Controllers\ClassroomController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\SubjectController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

// Dashboard:

Route::get('/dashboard-stats', [DashboardController::class, 'stats']);
Route::get('/new-students', [DashboardController::class, 'newlyAdmittedStudents']);

// Students:

Route::apiResource('students', StudentController::class);

// Classrooms:
Route::apiResource('classrooms', ClassroomController::class);

// Subjects:
Route::apiResource('subjects', SubjectController::class);