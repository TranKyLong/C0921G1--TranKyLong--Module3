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
  <form action="/tinhchietkhau"></form>
  <h4>  Mô tả của sản phẩm </h4> <input type="text">
  <h4>  Giá niêm yết của sản phẩm </h4> <input type="text" name="gia">
  <h4>  Tỷ lệ chiết khấu (phần trăm) </h4> <input type="text" name="chietkhau">

  <input type="submit" value="sum">
  <h4 style="background: orangered"> <%=request.getAttribute("tyLeChietKhau")%></h4>
  </body>
</html>
