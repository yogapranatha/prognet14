<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\admin;
use Illuminate\Support\Facades\Hash;
use Validator;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    public function DaftarAdmin(){
    	return view('admin/adminregister');
    }
    public function DaftarSubmit(Request $request){
        $file = $request->file('file');
        $tujuan = 'fotoadmin\\';
        $simpan =$tujuan.$file->getClientOriginalName();
        $file->move($tujuan,$file->getClientOriginalName());
        

        $new = new admin;
        $new->name = $request->name;
        $new->phone = $request->phone;
        $new->password = Hash::make($request->password);
        $new->username = $request->username;
        $new->profile_image = $simpan;
        $new->save();

     return redirect('admin/login');
    }


    public function LoginAdmin(){
   		return view('admin/adminlogin');
        
    }
    public function LoginSubmit(Request $request){
        $data = $request->only('username','password');
        if (Auth::guard('admin')->attempt($data)){
            return view('admin/dashboard');
        }else{
            return "Login gagal";
        }

    }

    public function Dashboard(){
    	return view('admin/dashboard');
    }

    public function LogoutAdmin(){
    	if(Auth::guard('admin')->check()){
			Auth::guard('admin')->logout();
		}
		return redirect('admin/login');
		}

    public function LihatProduct(){
        return view('admin/lihatproduct');
    }
}

