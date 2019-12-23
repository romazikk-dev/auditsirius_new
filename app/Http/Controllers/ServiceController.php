<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Service;

class ServiceController extends Controller
{
    //
    public function index(){
        $services = Service::orderBy('position', 'asc')->get();

        return response()->json($services);

        // echo 100;
    }
}
