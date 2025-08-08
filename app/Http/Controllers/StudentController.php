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
        if ($students->isEmpty()) {
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
            'DOB' => 'required|date',
            'phone_number' => ['required', 'regex:/^03\d{9}$/'],
            'subject_ids' => 'required|array|min:1',
            'subject_ids.*' => 'exists:subjects,id'
        ]);

        if ($validation->fails()) {
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
            ], 201);
            
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to register student due to internal server error.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $student = Student::find($id);

        if(is_null($student)){
            return response()->json([
            'success' => false,
            'message' => 'Student data not found with this id'
            ], 404);
        }

        $profile = $student->profile;
        $subjects = $student->subjects;

        if ($student && $profile && $subjects) {
            return response()->json([
                'success' => true,
                'message' => 'Student: ' . $student->name . ' data fetched successfully.',
                'data' => [
                    'student' => $student,
                    'profile' => $profile,
                    'subjects' => $subjects
                ]
            ], 200);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'sometimes|min:3',
            'email' => 'sometimes|unique:students,email',
            'classroom_id' => 'sometimes|exists:classrooms,id',
            'address' => 'sometimes|string',
            'DOB' => 'sometimes|date',
            'phone_number' => ['sometimes', 'regex:/^03\d{9}$/'],
            'subject_ids' => 'sometimes|array|min:1',
            'subject_ids.*' => 'exists:subjects,id'
        ]);

        if ($validation->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed.',
                'errors' => $validation->errors()->all()
            ], 422);
        }

        $validatedData = $validation->validated();

        DB::beginTransaction();

        try {

            $student = Student::findOrFail($id);
            $student->fill($validatedData);

            $profile = $student->profile;
            $profile->fill($validatedData);

            $subjects = $validatedData['subject_ids'] ?? [];

            if($student->isDirty()) $student->save();

            if($profile->isDirty()) $profile->save();

            if($subjects && !empty($subjects)){
                $student->subjects()->sync($subjects);
            }

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Student: ' . $student->name . ' data updated successfully.',
                'data' => $student
            ], 201);


        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to update student due to internal server error.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        DB::beginTransaction();

        try {
          
            $student = Student::findOrFail($id);

            $student->profile->delete();
            $student->subjects()->detach();
            $student->delete();

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Student data deleted successfully.'
            ], 200);

        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to delete student due to internal server error.',
                'error' => $e->getMessage()
            ], 500);
        }

    }
}
