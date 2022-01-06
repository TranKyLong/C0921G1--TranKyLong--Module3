<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--    <link rel="stylesheet" href="assert/boostrap/css/bootstrap.min.css">--%>

    <link rel="stylesheet" href="assert/bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assert/datatables/css/dataTables.bootstrap4.min.css"/>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <table id="tableStudent" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Birthday</th>
                    <th>Gender</th>
                    <th>IdCard</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Typeid</th>
                    <th>TypeName</th>
                    <th>Address</th>
                    <th> Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="showcustomer" items="${displayallcustomer}">

                    <tr>
                        <td><c:out value="${showcustomer.customerId}"/></td>
                        <td><c:out value="${showcustomer.customerName} "/></td>
                        <td><c:out value="${showcustomer.customerBirthday} "/></td>
                        <td><c:out value="${showcustomer.customerGender}"/></td>
                        <td><c:out value="${showcustomer.customerIdCard}"/></td>
                        <td><c:out value="${showcustomer.customerPhone}"/></td>
                        <td><c:out value="${showcustomer.customerEmail}"/></td>
                        <td><c:out value="${showcustomer.customerType.customerTypeID}"/></td>
                        <td><c:out value="${showcustomer.customerType.customerTypeName}"/></td>
                        <td><c:out value="${showcustomer.customerAddress}"/></td>
                        <td>
                            <a href="/customer?action=edit&id=${showcustomer.customerId}">
                                <button type="button" class="btn btn-primary" href="">Edit</button>
                            </a>


                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal-${showcustomer.customerId}">
                                Delete
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal-${showcustomer.customerId}" tabindex="-1"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Delete customer has name is ${showcustomer.customerName} and
                                            ID ${showcustomer.customerId} ?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No
                                            </button>
                                            <a href="/customer?action=delete&id=${showcustomer.customerId}">
                                                <button type="button" class="btn btn-primary" href="">Yes</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <a href="/customer?action=create">
                <button type="button" class="btn btn-success">CREATE NEW CUSTOMER</button>
            </a>
        </div>
    </div>
</div>
<script src="assert/jquery/jquery-3.5.1.min.js"></script>
<script src="assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="assert/boostrap/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
