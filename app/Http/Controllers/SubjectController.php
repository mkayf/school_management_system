<?php

namespace App\Http\Controllers;

use App\Models\Subject;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
class SubjectController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $subjects = Subject::all();

        if($subjects->isEmpty()){
            return response()->json([
                'success' => false,
                'message' => 'Failed to load subjects data.'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'message' => 'Student data fetched successfully.',
            'data' => $subjects
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'required|string|min:3',
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
            $subject = Subject::create([
                'name' => $validatedData['name'],
            ]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'new subject added succesfully.',
                'data' => $subject
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to add new subject due to internal server error.',
                'error' => $e->getMessage()
            ], 500);

        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $subject = subject::find($id);

        if(is_null($subject)){
            return response()->json([
            'success' => false,
            'message' => 'Subject not found with this ID.'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'message' => 'Subject: ' . $subject->name . ' fetched successfully.',
            'data' => $subject
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'sometimes|string|min:3',
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

            $subject = Subject::findOrFail($id);

            $subject->fill($validatedData);

            if($subject->isDirty()) $subject->save();

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Subject: ' . $subject->name . ' data updated successfully.',
                'data' => $subject
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to update subject due to internal server error.',
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

            $subject = Subject::findOrFail($id);

            $subject->delete();

            DB::commit();

            return response()->json([
            'success' => true,
            'message' => 'subject data deleted successfully.'
            ], 200);

        } catch (\Exception $e) {
             DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to delete subject due to internal server error.',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
