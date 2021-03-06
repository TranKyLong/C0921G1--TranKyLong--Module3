<%--
  Created by IntelliJ IDEA.
  User: pc01
  Date: 12/30/2021
  Time: 4:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="assert/css/furamaCss.css">
    <link rel="stylesheet" href="assert/boostrap/css/bootstrap.min.css">

</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="bg-light header  ">
                <div class="d-flex justify-content-between logo ">
                    <div class="logo_image "><img
                            src="http://www.codeproject.com/KB/GDI-plus/ImageProcessing2/img.jpg?w=144" alt="image">
                    </div>
                    <div><a href="#" class="logo_name ">Nguyễn Văn A</a></div>
                </div>

            </div>

            <nav class="navbar  navbar-expand-lg navbar-light nav_content">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="wid collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="drop_button navbar-nav me-auto mb-2 mb-lg-0 nav_item_1">
                        <li class="nav-item">
                            <a class="nav-link text-white " aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" aria-current="page" href="#">Employee</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-white" aria-current="page" href="/customer">Customer</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" aria-current="page" href="#">Services</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" aria-current="page" href="#">Contract</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </nav>

        </div>
    </div>
    <div class="row">
        <div class="col-3">
            <div class="bg-dark text-white side ">
                <div class="inner ">
                    <ul class="list-group-flush ">
                        <li><a href="/furama?action=create ">CREATE NEW CUSTOMER</a></li>
                        <li><a href="#">item2</a></li>
                        <li><a href="#">item3</a></li>
                    </ul>
                </div>

            </div>
        </div>

    </div>


    <footer class="bg-light text-center text-lg-start">
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            <a class="text-dark" href="#">Footer</a>
        </div>

    </footer>


</div>

<script src="assert/boostrap/js/bootstrap.min.js"></script>
</body>
</html>
