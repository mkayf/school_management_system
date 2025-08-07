<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Profile;
use App\Models\Classroom;
use App\Models\Subject;

class Student extends Model
{
    protected $fillable = ['name', 'email', 'classroom_id'];
    public function profile(){
        return $this->hasOne(Profile::class);
    }

    public function classroom(){
        return $this->belongsTo(Classroom::class);
    }

    public function subjects(){
        return $this->belongsToMany(Subject::class);
    }

}
