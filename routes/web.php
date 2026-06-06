<?php

use App\Http\Controllers\RecipeController;
use Illuminate\Support\Facades\Route;

Route::redirect('/', '/recipes');
Route::get('/recipes', [RecipeController::class, 'index'])->name('recipes.index');
