<?php
  $menu = [
    "blog" => [
      "status" => "",
      "active" => "",
      "posts" => "",
      "create_post" => "",
      "categories" => "",
      "create_category" => "",
      "comments" => "",
    ],
    "message" => [
      "index" => ""
    ]
  ];
  $menuBlogStatus = '';
  $menuBlogTreeStatus = '';
  $currRoute = Route::currentRouteName();
  if($currRoute == "blogetc.admin.index" ||
      $currRoute == "blogetc.admin.create_post" ||
      $currRoute == "blogetc.admin.edit_post" ||
      $currRoute == "blogetc.admin.categories.index" ||
      $currRoute == "blogetc.admin.categories.create_category" ||
      $currRoute == "blogetc.admin.categories.edit_category" ||
      $currRoute == "blogetc.admin.comments.index"){

        $menu['blog']['status'] = 'menu-open';
        $menu['blog']['active'] = 'active';

        if($currRoute == "blogetc.admin.index" || $currRoute == "blogetc.admin.edit_post"){
          $menu['blog']['posts'] = 'active';
        }else if($currRoute == "blogetc.admin.create_post"){
          $menu['blog']['create_post'] = 'active';
        }else if($currRoute == "blogetc.admin.categories.index" || $currRoute == "blogetc.admin.categories.edit_category"){
          $menu['blog']['categories'] = 'active'; 
        }else if($currRoute == "blogetc.admin.categories.create_category"){
          $menu['blog']['create_category'] = 'active'; 
        }
        else if($currRoute == "blogetc.admin.comments.index"){
          $menu['blog']['comments'] = 'active'; 
        }
  }

  if($currRoute == "messages.index"){
    $menu["message"]["index"] = 'active';
  }

  
?>

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="{{ asset('/assets/adminlte/dist/img/AdminLTELogo.png') }}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <!-- <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="{{ asset('/assets/adminlte/dist/img/user2-160x160.jpg') }}" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Alexander Pierce</a>
        </div>
      </div> -->

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview {{ $menu['blog']['status'] }}">
            <a href="#" class="nav-link {{ $menu['blog']['active'] }}">
              <i class="nav-icon fab fa-blogger-b"></i>
              <p>
                Блог
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('blogetc.admin.index') }}" class="nav-link {{ $menu['blog']['posts'] }}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Посты</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('blogetc.admin.create_post') }}" class="nav-link {{ $menu['blog']['create_post'] }}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Создать пост</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('blogetc.admin.categories.index') }}" class="nav-link {{ $menu['blog']['categories'] }}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Категории</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('blogetc.admin.categories.create_category') }}" class="nav-link {{ $menu['blog']['create_category'] }}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Создать категорию</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('blogetc.admin.comments.index') }}" class="nav-link {{ $menu['blog']['comments'] }}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Комментарии</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="{{ route('messages.index') }}" class="nav-link {{ $menu['message']['index'] }}">
              <i class="nav-icon fas fa-envelope"></i>
              <p>
                Сообщения
              </p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>