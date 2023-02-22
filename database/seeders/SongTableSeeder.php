<?php

namespace Database\Seeders;

use App\Models\Song;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SongTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $songs = [
            [
                'name' => 'Song 1'
            ],
            [
                'name' => 'Song 1'
            ],
            [
                'name' => 'Song 1'
            ]
        ];

        Song::insert($songs);
    }
}
