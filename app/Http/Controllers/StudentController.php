<?php

namespace App\Http\Controllers;

use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $students = Student::all();
        if(!$students){
            return response()->json([
                'success' => false,
                'message' => 'Failed to load student data.'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'message' => 'Student data fetched successfully.',
            'data' => $students 
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'required|min:3',
            'email' => 'required|unique:students,email',
            'classroom_id' => 'required',
            'address' => 'required',
            'DOB' => 'reuired|date',
            'phone_number' => 'required|regex:^(03\d{9}|3\d{9})$',
            'subjects' => 'required|array|min:1'
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
