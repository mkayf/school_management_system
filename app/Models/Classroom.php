<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Student;
class Classroom extends Model
{
 
    protected $fillable = ['name', 'section'];

    public function students(){
        return $this->hasMany(Student::class);
    }

}
