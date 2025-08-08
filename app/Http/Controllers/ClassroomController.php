<?php

namespace App\Http\Controllers;

use App\Models\Classroom;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class ClassroomController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $classrooms = Classroom::all();

        if ($classrooms->isEmpty()) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to load classrooms data.'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'message' => 'Student data fetched successfully.',
            'data' => $classrooms
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'required|string|min:3',
            'section' => "required|string"
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
            $classroom = Classroom::create([
                'name' => $validatedData['name'],
                'section' => $validatedData['section']
            ]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'new class added succesfully.',
                'data' => $classroom
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to add new class due to internal server error.',
                'error' => $e->getMessage()
            ], 500);

        }


    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $classroom = Classroom::find($id);

        if(is_null($classroom)){
            return response()->json([
            'success' => false,
            'message' => 'Classroom not found with this ID.'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'message' => 'Classroom: ' . $classroom->name . ' fetched successfully.',
            'data' => $classroom
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'sometimes|string|min:3',
            'section' => "sometimes|string"
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

            $classroom = Classroom::findOrFail($id);

            $classroom->fill($validatedData);

            if($classroom->isDirty()) $classroom->save();

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Classroom: ' . $classroom->name . ' data updated successfully.',
                'data' => $classroom
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to update classroom due to internal server error.',
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

            $classroom = Classroom::findOrFail($id);

            $classroom->delete();

            DB::commit();

            return response()->json([
            'success' => true,
            'message' => 'Classroom data deleted successfully.'
            ], 200);

        } catch (\Exception $e) {
             DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to delete classroom due to internal server error.',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
