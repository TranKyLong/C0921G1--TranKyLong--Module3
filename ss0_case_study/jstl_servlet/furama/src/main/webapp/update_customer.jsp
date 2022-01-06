<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

</head>
<body>
<div class="wrapper ">
    <div class="main-panel">
        <!-- Navbar -->
        <!-- End Navbar -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1>UPDATE CUSTOMER</h1>
                    </div>
                    <c:if test='${requestScope["message"] != null}'>
                        <span class="col-12 border bg-light">${requestScope["message"]}</span>
                    </c:if>
                    <form class="col-12" method="post" >

                        <div class="form-group col-12">
                            <label class="col-12 float-left" for="exampleInputVao7">Customer Id:</label>
                            <input readonly type="text" name="customerId_u" class="form-control col-12 mt-2"
                                   id="exampleInputVao7" value="${customer.customerId}">
                        </div>

                        <div class="form-group col-12">
                            <label class="col-12 float-left mt-1" for="exampleInputPosition">Customer type:</label>
                            <select name="customertype" id="exampleInputPosition"
                                    class="form-control col-12">
                                <option class="text-primary">Chose Customer Type</option>
                                <c:forEach items="${customerTypeList}" var="item">
                                    <c:choose>
                                        <c:when test="${item.customerTypeID == customer.customerType.customerTypeID}">
                                            <option value="${item.customerTypeID}"
                                                    selected> ${item.customerTypeName} </option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${item.customerTypeID}"> ${item.customerTypeName} </option>
                                        </c:otherwise>
                                    </c:choose>
                                    <%--<option value="${item.customerTypeID}"> ${item.customerTypeName} </option>--%>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group col-12">
                            <label class="col-12 float-left" for="exampleInputVao">Customer Name:</label>
                            <input type="text" name="customername" class="form-control col-12 mt-2"
                                   id="exampleInputVao" placeholder="Enter Name"
                                   value="${customer.customerName}">
                            <p class="text-danger"> ${nameCheck}</p>
                        </div>

                        <div class="form-group col-12">
                            <label class="col-12 float-left mt-1" for="exampleInputPosition6">Customer Gender:</label>
                            <select name="gender" id="exampleInputPosition6"
                                    class="form-control col-12">
                                <option value="-1" class="text-primary" selected>Chose gender</option>
                                <option value="1">Male</option>
                                <option value="0">Female</option>
                            </select>
                            <p class="text-danger"> ${gendercheck}</p>
                        </div>

                        <div class="form-group col-12">
                            <label class="col-12 float-left" for="exampleInputVao1">Customer Birthday:</label>
                            <input type="date" name="birthday" class="form-control col-12 mt-2"
                                   id="exampleInputVao1" placeholder="Enter Birthday"
                                   value="${customer.customerBirthday}">

                        </div>


                        <div class="form-group col-12">
                            <label class="col-12 float-left" for="exampleInputRa">Id Card:</label>
                            <input type="number" name="idCard" class="form-control col-12  mt-2"
                                   id="exampleInputRa" placeholder="Enter Id Card" value="${customer.customerIdCard}">
                            <p class="text-danger"> ${idCardCheck}</p>
                        </div>

                        <div class="form-group col-12">
                            <label class="col-12 float-left" for="exampleInputRa1">Phone:</label>
                            <input type="number" name="phone" class="form-control col-12  mt-2"
                                   id="exampleInputRa1" placeholder="Enter Phone" value="${customer.customerPhone}">
                            <p class="text-danger"> ${phoneCheck}</p>
                        </div>

                        <div class="form-group col-12">
                            <label class="col-12 float-left" for="exampleInputRa2">Customer Email:</label>
                            <input type="text" name="mail" class="form-control col-12  mt-2"
                                   id="exampleInputRa2" placeholder="Enter Email" value="${customer.customerEmail}">
                            <p class="text-danger"> ${mailCheck}</p>
                        </div>

                        <div class="form-group col-12">
                            <label class="col-12 float-left" for="exampleInputLyDo">Address:</label>
                            <input type="text" name="address" class="form-control col-12  mt-2"
                                   id="exampleInputLyDo" placeholder="Enter Address"
                                   value="${customer.customerAddress}">

                        </div>

                            <button type="submit" class="btn btn-primary float-right">Update</button>
                        <a href="/customer?action=showlist">
                            <button type="button" class="btn btn-info float-right">Back</button>
                        </a>
                    </form>
                </div>
            </div>
        </div>
        <%-- Footer --%>
    </div>
</div>
</body>
</html>