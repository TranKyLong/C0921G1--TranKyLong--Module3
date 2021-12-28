<%--
  Created by IntelliJ IDEA.
  User: pc01
  Date: 12/28/2021
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edit product</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/Product">Back </a>
</p>
<form method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Id:</td>
                <td><input type="text" name="id" id="id" value="${Product.getId()}"></td>
            </tr>
            <tr>
                <td>Tên:</td>
                <td><input type="text" name="ten" id="ten" value="${Product.getTen()}"></td>
            </tr>
            <tr>
                <td>Giá:</td>
                <td><input type="text" name="gia" id="gia" value="${Product.getGia()}"></td>
            </tr>
            <tr>
                <td>Mô tả:</td>
                <td><input type="text" name="mota" id="mota" value="${Product.getMoTa()}"></td>
            </tr>
            <tr>
                <td>Nhà sản xuất:</td>
                <td><input type="text" name="nsx" id="nsx" value="${Product.getNsx()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update "></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
