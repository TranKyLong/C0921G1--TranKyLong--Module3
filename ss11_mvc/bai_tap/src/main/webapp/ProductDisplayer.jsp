<%--
  Created by IntelliJ IDEA.
  User: pc01
  Date: 12/27/2021
  Time: 11:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HomePage</title>
    <link rel="stylesheet" href="mvccss.css">
</head>
<body>s
<div>
    <button><a style="text-align: center" href="/Product?action=create">Thêm sản phẩm</a></button>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Giá sản phẩm</th>
            <th>Sửa</th>
            <th>Xóa</th>
        </tr>
        <c:forEach items='${requestScope["Product"]}' var="p">
        <tr>
            <td><a href="/Product?action=view&id=${p.getId()}">${p.getId()}</a></td>
            <td>${p.getTen()}</td>
            <td>${p.getGia()}</td>
            <td><a href="/Product?action=edit&id=${p.getId()}">edit</a></td>
            <td><a href="/Product?action=delete&id=${p.getId()}">delete</a></td>
        </tr>
        </c:forEach>
</div>
</body>
</html>
