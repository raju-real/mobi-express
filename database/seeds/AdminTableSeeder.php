<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AdminTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
         DB::table('admins')->insert([
            'role_id' => 1,
            'name' => 'Super Admin',
            'email' => 'admin@admin.com',
            'mobile' => '01889967514',
            'password' => Hash::make('123456'),
        ]);
    }
}
