<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Song;
use Illuminate\Http\Request;

class SongController extends Controller
{
    public function getSongs()
    {
        $songs = Song::all();
        return response()->json($songs,200);
    }
}
