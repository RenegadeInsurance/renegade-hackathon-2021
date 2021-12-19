<?php

namespace Modules\Assesment\Entities;

use Jenssegers\Mongodb\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class FlowRelation extends Model
{
    use HasFactory;

    protected $connection = "mongodb";
    protected $guarded = [];
}
