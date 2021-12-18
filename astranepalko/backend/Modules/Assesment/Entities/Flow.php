<?php

namespace Modules\Assesment\Entities;

use Jenssegers\Mongodb\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Flow extends Model
{
    use HasFactory;

    protected $connection = "mongodb";
    protected $guarded = [];

    protected static function newFactory()
    {
        return \Modules\Assesment\Database\factories\FlowFactory::new();
    }
}
