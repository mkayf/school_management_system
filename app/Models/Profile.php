<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Student;


class Profile extends Model
{   
    protected $fillable = ['student_id', 'address', 'DOB', 'phone_number'];

    public function student(){
        return $this->belongsTo(Student::class);
    }
}
