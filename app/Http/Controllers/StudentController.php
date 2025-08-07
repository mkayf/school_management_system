<?php

namespace App\Http\Controllers;

use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
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
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'required|min:3',
            'email' => 'required|unique:students,email',
            'classroom_id' => 'required|exists:classrooms,id',
            'address' => 'required|string',
            'DOB' => 'reuired|date',
            'phone_number' => 'required|regex:/^(03\d{9}|3\d{9})$/',
            'subjects_ids' => 'required|array|min:1',
            'subjects_ids.*' => 'exists:subjects,id'
        ]);

        if($validation->fails()){
            return response()->json([
                'success' => false,
                'message' => 'Validation failed.',
                'errors' => $validation->errors()->all()
            ], 422);
        }

        $validatedData = $validation->validated();

        DB::beginTransaction();

        try {
            $student = Student::create([
                'name' => $validatedData['name'],
                'email' => $validatedData['email'],
                'classroom_id' => $validatedData['classroom_id']
            ]);

            $profile = $student->profile()->create([
                'address' => $validatedData['address'],
                'DOB' => $validatedData['DOB'],
                'phone_number' => $validatedData['phone_number']
            ]);

            $student->subjects()->attach($validatedData['subject_ids']);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Student registered succesfully.',
                'data' => $student
            ]);

        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to register student due to internal server error.'
            ]);
        }
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
