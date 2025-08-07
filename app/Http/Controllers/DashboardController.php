<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Student;
use App\Models\Subject;
use App\Models\Classroom;

class DashboardController extends Controller
{
    public function stats(){
        return response()->json([
            'total_students' => Student::count(),
            'total_classrooms' => Classroom::count(),
            'total_subjects' => Subject::count(),
        ], 200);
    }
}
