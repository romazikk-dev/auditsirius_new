<table>
    <tr>
        <td>Name:</td>
        <td>{{  $message->name }}</td>
    </tr>

    @if($message->type == "free_consultation")
    <tr>
        <td>Email:</td>
        <td>{{  $message->email }}</td>
    </tr>
    @endif

    <tr>
        <td>Телефон:</td>
        <td>{{  $message->phone }}</td>
    </tr>

    @if($message->type == "free_consultation")
    <tr>
        <td>Тип:</td>
        <td>{{  $message->type }}</td>
    </tr>
    <tr>
        <td>Создано:</td>
        <td>{{  $message->created_at }}</td>
    </tr>
    <tr>
        <td>Сообщение:</td>
        <td>{{  $message->text }}</td>
    </tr>
    @endif
    
</table>
{{  dd($message->name) }}
