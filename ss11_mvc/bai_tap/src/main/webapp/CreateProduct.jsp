<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="mvccss.css">
</head>
<body>


<p>
    <c:if test='${requestScope["message"] != null}'>
        <span>${requestScope["message"]}</span>
    </c:if>
</p>
<div class="col-12">
    <div class="align-content-center">
    <form method="post">

        <fieldset>
            <legend class="text-decoration-underline text-primary border-1 fw-bold">THÔNG TIN SẢN PHẨM</legend>
            <table>
                <tr>
                    <td>Tên:</td>
                    <td><input type="text" name="ten" id="ten"></td>
                </tr>
                <tr>
                    <td>Nhà sản xuất:</td>
                    <td><input type="text" name="nsx" id="nsx"></td>
                </tr>
                <tr>
                    <td>Giá:</td>
                    <td><input type="text" name="gia" id="gia"></td>
                </tr>
                <tr>
                    <td>Mô tả:</td>
                    <td><input type="text" name="mota" id="mota"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Thêm sản phẩm"></td>
                </tr>
            </table>
        </fieldset>
    </form>
    <button>
        <a href="/Product">Quay lại </a>
    </button>
    </div>
</div>
<script src="js/bootstrap.min.js"></script>

</body>
</html>
