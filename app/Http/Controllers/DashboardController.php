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
            'success' => true,
            'message' => 'Stats fetched successfully!',
            'total_students' => Student::count(),
            'total_classrooms' => Classroom::count(),
            'total_subjects' => Subject::count(),
        ], 200);
    }

    public function newlyAdmittedStudents(){
        // Get the
        $students = Student::latest()->limit(5)->get();

        if($students->isEmpty()){
            return response()->json([
                'success' => false,
                'message' => 'Student data not found.',
            ], 422);
        }

        return response()->json([
            'success' => true,
            'message' => 'Students data fetched successfully.',
            'data' => $students
        ]);

        

    }

}
