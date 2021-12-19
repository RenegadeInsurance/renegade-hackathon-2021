<?php

namespace Modules\Response\Entities;

use Jenssegers\Mongodb\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Response extends Model
{
    use HasFactory;

    protected $connection = "mongodb";
    protected $guarded = [];

    protected static function newFactory()
    {
        return \Modules\Response\Database\factories\ResponseFactory::new();
    }
}
