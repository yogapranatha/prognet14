<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Admin extends Authenticatable
{
   protected $guard = 'Admin';
   protected $table = 'admins';

   protected $fillable = [
   		'username', 'password',
   ];

   protected $hidden = [
   		'password', 'remember_token',
   ];
}
