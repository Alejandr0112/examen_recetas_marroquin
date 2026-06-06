<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Recipe extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'category',
        'preparation_time',
        'chef_id',
    ];

    public function chef(): BelongsTo
    {
        return $this->belongsTo(Chef::class);
    }
}
