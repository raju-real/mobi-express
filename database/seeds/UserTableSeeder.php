<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'is_admin' => 2,
            'name' => 'Mr. Demo',
            'email' => 'demo@gmail.com',
            'mobile' => '01889967514',
            'password' => Hash::make('123456'),
        ]);
    }
}
