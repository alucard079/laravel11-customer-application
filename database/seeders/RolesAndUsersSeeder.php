<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Spatie\Permission\Models\Role;

class RolesAndUsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user1 = User::create([
            'firstname' => 'John',
            'lastname'  => 'Doe',
            'email'     => 'johndoe@example.com',
            'password'  => bcrypt('password'),
        ]);

        $user2 = User::create([
            'firstname' => 'Jane',
            'lastname'  => 'Doe',
            'email'     => 'janedoe@example.com',
            'password'  => bcrypt('password'),
        ]);
    }
}
