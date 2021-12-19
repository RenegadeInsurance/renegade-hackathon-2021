<?php

use Illuminate\Support\Facades\Route;

Route::name("api.")
    // ->middleware(["auth:api"])
    ->group(function () {
        Route::resource("questions", Api\QuestionController::class);
        Route::resource("answers", Api\AnswerController::class);
        Route::resource("flows", Api\FlowController::class);
    });
