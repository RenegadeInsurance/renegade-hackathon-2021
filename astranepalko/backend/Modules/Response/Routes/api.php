<?php

use Illuminate\Support\Facades\Route;

Route::name("api.")
    // ->middleware(["auth:api"])
    ->group(function () {
        Route::resource("responses", Api\ResponseController::class);
    });
