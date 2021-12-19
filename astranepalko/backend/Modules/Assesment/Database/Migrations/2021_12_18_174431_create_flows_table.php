<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFlowsTable extends Migration
{
    public function up(): void
    {
        Schema::create('flows', function (Blueprint $table) {
            $table->id();
            $table->text("name");
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('flows');
    }
}
