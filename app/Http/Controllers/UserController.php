<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Hash;
use App\Mail\verifikasiuser;
use \Mail;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\AUTH;
use Illuminate\Support\Facades\AuthenticatesUsers;

class UserController extends Controller
{
        public function dashboard(){
        return view('user/dashboard');
    }

    public function LoginUser(){
        return view('user/loginuser');
    }

    public function DaftarUser(){
        return view('user/registeruser');
    }

    public function DaftarSubmit(Request $request){
        $file = $request->file('file');
        $tujuan = 'fotouser\\';
        $disimpan =$tujuan.$file->getClientOriginalName();
        $file->move($tujuan,$file->getClientOriginalName());

        $new = new User;
        $new->name = $request->name;
        $new->email = $request->email;
        $new->password = Hash::make($request->password);
        $new->status = $request->status;
        $new->profile_image = $disimpan;
        $new->save();
        Mail::to($request->email)->send(new verifikasiuser(($new)));

        return redirect('user/login?alert=belum_verifikasi');

    }

    public function LoginSubmit(Request $request){
        $data = $request->only('email','password');
        if(Auth::guard('user')->attempt($data)){
            return redirect('user/dashboard');
        }else{
            return "gagal login";
        }
    }



	public function verifikasiemail($email){
        $verifikasi = DB::statement('UPDATE users SET users.`email_verified_at`=NOW() WHERE users.email = ?',array($email));

        return view('user/loginuser');
    }

    public function Logout(){
        if(Auth::guard('user')->check()){
            Auth::guard('user')->logout();
        }
            return redirect('user/login');
    }
}
