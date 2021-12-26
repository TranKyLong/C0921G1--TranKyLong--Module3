<%--
  Created by IntelliJ IDEA.
  User: pc01
  Date: 12/24/2021
  Time: 11:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="tableCss.css">
</head>
<body>
<table>
    <tr>
        <th>Name</th>
        <th>Date of Bird</th>
        <th>Gender</th>
        <th>Image</th>
    </tr>
    <c:forEach var="customerObj" items="${listCustomer}">
        <tr >
            <td><c:out value="${customerObj.ten}"/></td>
            <td><c:out value="${customerObj.ngaySinh}"/></td>
            <td><c:out value="${customerObj.diaChi}"/></td>
            <td>
                <div class="tablerow" ><img src="<c:out value="${customerObj.anh}"/>" alt="imaging"></div>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
