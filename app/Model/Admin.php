<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Admin extends Authenticatable
{
	use Notifiable;
    protected $guard = 'admin';

    protected $fillable = [
        'role_id','name', 'email','mobile', 'password',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];
}
