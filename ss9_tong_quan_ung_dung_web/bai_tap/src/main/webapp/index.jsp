<%--
  Created by IntelliJ IDEA.
  User: pc01
  Date: 12/23/2021
  Time: 11:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form action="/tinhchietkhau" method="post">
    <h4> Mô tả của sản phẩm </h4> <label>
    <input type="text">
</label>
    <h4> Giá niêm yết của sản phẩm </h4> <label>
    <input type="text" name="gia">
</label>
    <h4> Tỷ lệ chiết khấu (phần trăm) </h4> <label>
    <input type="text" name="chietkhau">
</label>

    <input type="submit" value="sum">
    <h4 style="background: orangered"><%=request.getAttribute("tyLeChietKhau")%>
    </h4>
</form>
</body>
</html>
