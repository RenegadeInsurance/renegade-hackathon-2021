<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAnswersTable extends Migration
{
    public function up(): void
    {
        Schema::create('answers', function (Blueprint $table) {
            $table->id();
            $table->text("answer");
            $table->float("weight");
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('answers');
    }
}
