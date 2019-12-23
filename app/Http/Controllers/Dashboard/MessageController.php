<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller; 
use App\Message;
use App\Grids\MessagesGridInterface;

class MessageController extends Controller
{
    //
    public function index(MessagesGridInterface $messageGrid, Request $request){
        $messages = Message::paginate(5);

        return $messageGrid
                    ->create(['query' => Message::query(), 'request' => $request])
                    ->withoutSearchForm()
                    ->renderOn('admin.message.index'); // render the grid on the welcome view
        // return view('admin.message.index');
    }

    public function edit(Request $request, $id){

    }

    public function getOne(Request $request, $id){
        
        // return view('admin.message.modal', ['id' => $id]);

        $message = Message::findOrFail($id);

        return view('admin.message.modal', ['message' => $message]);
        // return view('admin.message.modal')->render();
        // $modal = [
        //     'model' => class_basename(User::class),
        //     'route' => route('users.store'),
        //     'action' => 'create',
        //     'pjaxContainer' => $request->get('ref'),
        // ];

        // // modal
        // return view('admin.message.modal', compact('modal'))->render();

    }
}
