<?php

namespace Modules\Assesment\Entities;

use Jenssegers\Mongodb\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Answer extends Model
{
    use HasFactory;

    protected $connection = "mongodb";
    protected $guarded = [];
    protected $appends = ["next"];

    protected static function newFactory()
    {
        return \Modules\Assesment\Database\factories\AnswerFactory::new();
    }

    public function getNextAttribute()
    {
        $flow_relation = FlowRelation::where('answer_id', $this->_id)->first();
        if ($flow_relation == null) {
            return null;
        }

        return Question::find($flow_relation->next_id);
    }
}
