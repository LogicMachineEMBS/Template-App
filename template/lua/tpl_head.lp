<?
  local rpath = request.path
  dofile(rpath .. "lua/init.lua")
  dofile(rpath .. "lua/lib.lua")
?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, user-scalable=no">
  <!-- <meta name="viewport" content="user-scalable=no"> -->
  <meta name="author" content="EMBS">
  <title>Template</title>
  <meta name="title" content="#">
  <meta name="description" content="Learn how to code...">
  <meta name="theme-color" content="#000">

  <link href="bootstrap/bootstrap.min.css" rel="stylesheet">
  <link href="core/style.css" rel="stylesheet">
  <script src="bootstrap/bootstrap.bundle.min.js"></script>
  <script src="bootstrap/popper.min.js"> </script>
  <script src="jquery/jquery.min.js"></script>
  <link rel="stylesheet" href="bootstrap/bootstrap-icons.css">
  <link rel="stylesheet" href="/apps/css/font-awesome.css?v=dev">
  <link href="icon.png" rel="icon">
</head>

<body class="bg-light">

  <header class="bg-dark">

    <div class="dropdown position-absolute top-0 start-0">
      <span class="btn btn-dark dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fa fa-bars"></i> <span class="fs-5">Template</span>
      </span>
      <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="/apps/data/template">About Template</a>
        <a class="dropdown-item" href="/apps/data/template/form_validity.lp">Form validity</a>
        <a class="dropdown-item" href="/apps/data/template/storage_and_redis.lp">Storage and Redis</a>
        <a class="dropdown-item" href="/apps/data/template/knx_objects.lp">KNX objects</a>
      </div>
    </div>

    <div class="buttons position-absolute top-0 end-0">
      <a class="btn btn-dark" href="/apps">
        <i class="fa fa-times"></i>
      </a>
    </div>

  </header>
