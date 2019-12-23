<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title></title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="{{ asset('/assets/adminlte/plugins/fontawesome-free/css/all.min.css') }}">
  <link rel="stylesheet" href="{{ asset('/css/app.css') }}">
</head>
<body>

    <!-- <div class="wrapperr">  -->
        <div id="app">
        <!-- <h1>Hello App!</h1>
        <p> -->
            <!-- use router-link component for navigation. -->
            <!-- specify the link by passing the `to` prop. -->
            <!-- `<router-link>` will be rendered as an `<a>` tag by default -->
            <!-- <router-link to="/foo">Go to Foo</router-link>
            <router-link to="/bar">Go to Bar</router-link>
        </p> -->
        <!-- route outlet -->
        <!-- component matched by the route will render here -->
            <router-view></router-view>
        </div>
    <!-- </div> -->

 
<script src="{{ asset('/js/app.js') }}"></script>

</body>
</html>