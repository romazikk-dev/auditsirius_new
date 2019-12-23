<?php

namespace App\Grids;

use Closure;
use Leantony\Grid\Grid;

class MessagesGrid extends Grid implements MessagesGridInterface
{
    /**
     * The name of the grid
     *
     * @var string
     */
    protected $name = 'messages';

    /**
     * List of buttons to be generated on the grid
     *
     * @var array
     */
    protected $buttonsToGenerate = [
        // 'create',
        // 'view',
        // 'delete',
        // 'refresh',
        // 'export'
    ];

    /**
     * Specify if the rows on the table should be clicked to navigate to the record
     *
     * @var bool
     */
    protected $linkableRows = false;

    /**
    * Set the columns to be displayed.
    *
    * @return void
    * @throws \Exception if an error occurs during parsing of the data
    */
    public function setColumns()
    {
        $this->columns = [
		    "name" => [
		        "label" => "Имя",
		        "filter" => [
		            "enabled" => true,
                    // "operator" => "="
                    "query" => function($query, $columnName, $userInput) {
                        // dd($query);
                        return $query->where("name", "like", "%" . $userInput . "%");
                                        // ->orWhere("first_name", "like", "%" . $userInput . "%")
                        // return false;
                    }
		        ],
		        // "styles" => [
		        //     "column" => "grid-w-10"
		        // ]
            ],
            "email" => [
                "label" => "Email",
                "raw" => true,
		        "filter" => [
		            "enabled" => true, 
                    // "operator" => "="
                    // "query" => function($query, $columnName, $userInput) {
                    //     // dd($query);
                    //     return $query->where("name", "like", "%" . $userInput . "%");
                    //                     // ->orWhere("first_name", "like", "%" . $userInput . "%")
                    //     // return false;
                    // }
                ],
                'presenter' => function ($columnData, $columnName) {
                    if(is_null($columnData->email)){
                        return '<div style="text-align: center;">Нет</div>';
                    }
                    return $columnData->email;
                },
		        // "styles" => [
		        //     "column" => "grid-w-10"
		        // ]
            ],
            "phone" => [
                "label" => "Телефон",
                "raw" => true,
		        "filter" => [
		            "enabled" => true, 
                    // "operator" => "="
                    // "query" => function($query, $columnName, $userInput) {
                    //     // dd($query);
                    //     return $query->where("name", "like", "%" . $userInput . "%");
                    //                     // ->orWhere("first_name", "like", "%" . $userInput . "%")
                    //     // return false;
                    // }
                ],
                'presenter' => function ($columnData, $columnName) {
                    if(is_null($columnData->phone)){
                        return '<div style="text-align: center;">Нет</div>';
                    }
                    return $columnData->phone;
                },
		        // "styles" => [
		        //     "column" => "grid-w-10"
		        // ]
            ],
            "type" => [
		        "label" => "Тип",
		        "filter" => [
                    "enabled" => true, 
                    'type' => 'select',
                    'data' => [
                        "free_consultation" => "Консультация",
                        "callback" => "Перезвонить",
                    ],
                    // "operator" => "="
                    // "query" => function($query, $columnName, $userInput) {
                    //     // dd($query);
                    //     return $query->where("name", "like", "%" . $userInput . "%");
                    //                     // ->orWhere("first_name", "like", "%" . $userInput . "%")
                    //     // return false;
                    // }
                ],
                "raw" => true,
                'presenter' => function ($columnData, $columnName) {
                    $el = "<div style='text-align: center;'>";
                    if($columnData->type == 'free_consultation'){
                        $el .= '<span class="badge badge-success">Консультация</span>';
                    }else if($columnData->type == 'callback'){
                        $el .= '<span class="badge badge-info">Перезвонить</span>';
                    }else{
                        $el .= '<span class="badge badge-default">Отсутствует</span>';
                    }
                    $el .= "</div>";
                    return $el;
                }
            ],
            "response" => [
		        "label" => "Отв.",
		        "filter" => [
                    "enabled" => true, 
                    'type' => 'select',
                    'data' => [
                        "email" => "Email",
                        "phone" => "Телефон",
                    ],
                    // "operator" => "="
                    "query" => function($query, $columnName, $userInput) {
                        // dd($query);
                        return $query->where([["response", "=", $userInput], ["type", "=", "free_consultation"]]);
                                        // ->orWhere("first_name", "like", "%" . $userInput . "%")
                        // return false;
                    }
                ],
                "raw" => true,
                'presenter' => function ($columnData, $columnName) {
                    $el = "<div style='text-align: center;'>";
                    if($columnData->type == 'free_consultation'){
                        
                        if($columnData->response == 'phone'){
                            $el .= '<i class="fas fa-phone"></i>';
                        }else if($columnData->response == 'email'){
                            $el .= '<i class="far fa-envelope"></i>';
                        }else{
                            $el .= 'Нет';
                        }
                        
                    }else{
                        $el .= 'Нет';
                    }
                    $el .= "</div>";
                    return $el;
                }
		    ],
		    "created_at" => [
                "label" => "Создано",
		        "sort" => false,
                "date" => "true",
		        "filter" => [
		            "enabled" => true,
		            // "type" => "date",
                    // "operator" => "<=",
                    "query" => function($query, $columnName, $userInput) {
                        // dd($query);
                        $dates = explode("|", $userInput);
                        return $query->where("created_at", ">=", date('Y-m-d H:i:s', strtotime($dates[0])))
                                     ->where("created_at", "<=", date('Y-m-d H:i:s', strtotime($dates[1]) + 86400));
                    }
                ],
		    ]
		];
    }

    /**
     * Set the links/routes. This are referenced using named routes, for the sake of simplicity
     *
     * @return void
     */
    public function setRoutes()
    {
        // searching, sorting and filtering
        $this->setIndexRouteName('messages.index');

        // crud support
        $this->setCreateRouteName('messages.create');
        $this->setViewRouteName('messages.show');
        $this->setDeleteRouteName('messages.destroy');

        // default route parameter
        $this->setDefaultRouteParameter('id');
    }

    /**
    * Return a closure that is executed per row, to render a link that will be clicked on to execute an action
    *
    * @return Closure
    */
    public function getLinkableCallback(): Closure
    {
        return function ($gridName, $item) {
            return route($this->getViewRouteName(), [$gridName => $item->id]);
        };
    }

    /**
    * Configure rendered buttons, or add your own
    *
    * @return void
    */
    public function configureButtons()
    {
        $this->makeCustomButton([
            'name' => 'del',
            'title' => 'Просмотр',
            // 'showModal' => true,
            'onclick' => 'alert(100)',
            'dataAttributes' => [
                // to optionally change the size of the modal. see https://getbootstrap.com/docs/4.0/components/modal/#optional-sizes
                'modal-size' => 'modal-lg',
            ],
            'attributes' => [
                // to optionally change the size of the modal. see https://getbootstrap.com/docs/4.0/components/modal/#optional-sizes
                'onclick' => "if(!confirm('Вы действительно хотите удалить это сообщение?')){ return false; }",
            ],
            'url' => url('/'),
            // 'url' => function($gridName, $gridItem) {
            //     // return route('messages.edit', ["id" => $gridItem->id]);
            //     return "/dash/messages/" . $gridItem->id;
            // },
            'class' => 'btn btn-outline-danger btn-sm',
        ], 'rows')->render([
            'gridName'=>$this->name,
            'gridItem'=>$this,
        ]);

        // $this->editRowButton('myview', [
        //     'name' => 'Просмотр',
        // ]);
        
        
        // $this->makeCustomButton([
        //     'name' => 'myview',
        //     'title' => 'Просмотр',
        //     'showModal' => true,
        //     'dataAttributes' => [
        //         // to optionally change the size of the modal. see https://getbootstrap.com/docs/4.0/components/modal/#optional-sizes
        //         'modal-size' => 'modal-lg'
        //     ],
        //     // 'url' => url('/dash/messages/' . $gridItem->id),
        //     'url' => function($gridName, $gridItem) {
        //         // return route('messages.edit', ["id" => $gridItem->id]);
        //         return "/dash/messages/" . $gridItem->id;
        //     },
        // ], 'rows')->render([
        //     'gridName'=>$this->name,
        //     'gridItem'=>$this,
        // ]);

        // $this->editRowButton('myview', [
        //     'name' => 'Просмотр',
        // ]);

        // $this->editRowButton('view', [
        //     'name' => 'Просмотр',
        //     'showModal' => true,
        //     'dataAttributes' => [
        //         // to optionally change the size of the modal. see https://getbootstrap.com/docs/4.0/components/modal/#optional-sizes
        //        'modal-size' => 'modal-sm'
        //    ]
        // ])->render([
        //         'gridName'=>$this->name,
        //         'gridItem'=>$this,
        //     ]);
        $this->editRowButton('delete', [
            'name' => 'Удалить',
        ]);

        // call `addRowButton` to add a row button
        // call `addToolbarButton` to add a toolbar button
        // call `makeCustomButton` to do either of the above, but passing in the button properties as an array

        // call `editToolbarButton` to edit a toolbar button
        // call `editRowButton` to edit a row button
        // call `editButtonProperties` to do either of the above. All the edit functions accept the properties as an array
    }

    /**
    * Returns a closure that will be executed to apply a class for each row on the grid
    * The closure takes two arguments - `name` of grid, and `item` being iterated upon
    *
    * @return Closure
    */
    public function getRowCssStyle(): Closure
    {
        return function ($gridName, $item) {
            // e.g, to add a success class to specific table rows;
            // return $item->id % 2 === 0 ? 'table-success' : '';
            return "";
        };
    }
}