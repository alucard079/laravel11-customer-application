<?php

namespace App\Services;

use App\Models\User;

class UserService
{
    /**
     * Get all users.
     *
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function getAllUsers()
    {
        return User::all();
    }

    /**
     * Create a new user.
     *
     * @param array $data
     * @return \App\Models\User
     */
    public function createUser(array $data)
    {
        return User::create([
            'firstname' => $data['firstname'],
            'lastname' => $data['lastname'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
            'contact_number' => $data['contact_number'],
        ]);
    }

    /**
     * Update an existing user.
     *
     * @param \App\Models\User $user
     * @param array $data
     * @return \App\Models\User
     */
    public function updateUser(User $user, array $data)
    {
        $user->update([
            'firstname' => $data['firstname'],
            'lastname' => $data['lastname'],
            'email' => $data['email'],
            'contact_number' => $data['contact_number'],
        ]);

        return $user;
    }

    /**
     * Delete a user.
     *
     * @param \App\Models\User $user
     * @return void
     */
    public function deleteUser(User $user)
    {
        $user->delete();
    }
}