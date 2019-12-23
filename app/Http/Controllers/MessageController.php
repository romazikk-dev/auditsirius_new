<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Message;
use App\Rules\messageResponse;
use App\Rules\messageType;

class MessageController extends Controller
{
    //
    public function add(){

        // $validated = request()->validate([
        //     'logs.name' => 'required',
        //     'logs.phone' => 'required|regex:/^[+]{1}38 \(([0-9]{3})\) [0-9]{3}(-[0-9]{2}){2}$/',
        //     'logs.email' => 'required|email',
        //     'logs.response' => [new messageResponse],
        //     'logs.type' => ['required', new messageType],
        // ]);

        // dd($validated['logs']);

        $message = new Message(request()->validate([
            'logs.name' => 'required',
            'logs.phone' => 'regex:/^[+]{1}38 \(([0-9]{3})\) [0-9]{3}(-[0-9]{2}){2}$/',
            'logs.email' => 'email',
            'logs.response' => [new messageResponse],
            'logs.type' => ['required', new messageType],
        ])['logs']);

        $message->save();

        return response()->json(["status" => "success"]); 
        // dd(request('logs'));
    }
}