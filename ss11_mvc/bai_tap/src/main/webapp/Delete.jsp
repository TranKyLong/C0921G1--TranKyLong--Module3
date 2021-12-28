<%--
  Created by IntelliJ IDEA.
  User: pc01
  Date: 12/28/2021
  Time: 8:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Delete Product</h1>
<button>
    <a href="/Product">Trở về</a>
</button>
<form method="post">
    <h3>Xác nhận xóa?</h3>
    <fieldset>
        <legend>Product Information</legend>
        <table>
            <tr>
                <td>Id:</td>
                <td>${Product.id}</td>
            </tr>
            <tr>
                <td>Tên:</td>
                <td>${Product.getTen()}</td>
            </tr>
            <tr>
                <td>Giá:</td>
                <td>${Product.getGia()}</td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Delete"></td>

            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>

