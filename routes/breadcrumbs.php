<?php


Breadcrumbs::for('home', function ($trail) {
    $trail->push('Home', route('home'));
});

Breadcrumbs::for('blog.index', function ($trail) {
    $trail->push('Admin', route('home'));
    $trail->push('Блог', route('home'));
});

Breadcrumbs::for('blog.post.create', function ($trail) {
    $trail->push('Admin', route('home'));
    $trail->push('Блог', route('blogetc.admin.index')); 
    $trail->push('Новый пост');
});

Breadcrumbs::for('blog.post.edit', function ($trail) {
    $trail->push('Admin', route('home'));
    $trail->push('Блог', route('blogetc.admin.index')); 
    $trail->push('Редактирование');
});

Breadcrumbs::for('blog.categories', function ($trail) {
    $trail->push('Admin', route('home'));
    $trail->push('Блог', route('blogetc.admin.categories.index')); 
    $trail->push('Категории');
});

Breadcrumbs::for('blog.category.edit', function ($trail) {
    $trail->push('Admin', route('home'));
    $trail->push('Блог', route('blogetc.admin.index')); 
    $trail->push('Категории', route('blogetc.admin.categories.index'));
    $trail->push('Редактирование');
});

Breadcrumbs::for('messages.index', function ($trail) {
    $trail->push('Admin', route('home'));
    $trail->push('Сообщения'); 
});