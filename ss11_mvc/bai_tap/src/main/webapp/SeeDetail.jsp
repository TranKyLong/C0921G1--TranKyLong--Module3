<%--
  Created by IntelliJ IDEA.
  User: pc01
  Date: 12/28/2021
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Title</title>
    <style>
        table,  td {
            border: 1px solid blue;
            border-collapse: collapse;
        }
        td {
            width: 170px;
        }

    </style>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/Product">Back </a>
</p>
<table>
    <tr>
        <td>ID: </td>
        <td>${requestScope["Product"].getId()}</td>
    </tr>
    <tr>
        <td>Tên: </td>
        <td>${requestScope["Product"].getTen()}</td>
    </tr>
    <tr>
        <td>Giá: </td>
        <td>${requestScope["Product"].getGia()}</td>
    </tr>
    <tr>
        <td>Mô tả: </td>
        <td>${requestScope["Product"].getMoTa()}</td>
    </tr>
    <tr>
        <td>Nhà sản xuất: </td>
        <td>${requestScope["Product"].getNsx()}</td>
    </tr>
</table>
</body>
</html>
