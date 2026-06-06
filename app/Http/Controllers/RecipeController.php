<?php

namespace App\Http\Controllers;

use App\Models\Recipe;
use Illuminate\View\View;

class RecipeController extends Controller
{
    public function index(): View
    {
        $recipes = Recipe::with('chef')->get();

        return view('recipes.index', compact('recipes'));
    }
}
