<?php

namespace Modules\Assesment\Entities;

use Jenssegers\Mongodb\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Question extends Model
{
    use HasFactory;

    protected $connection = "mongodb";
    protected $guarded = [];
    protected $appends = ["answers_data"];

    protected static function newFactory()
    {
        return \Modules\Assesment\Database\factories\QuestionFactory::new();
    }

    public function getAnswersDataAttribute()
    {
        return Answer::whereIn('_id', $this->answers)->get();
    }
}
