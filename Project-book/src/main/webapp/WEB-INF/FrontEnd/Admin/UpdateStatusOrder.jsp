<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <c:set value="/WEB-INF/FrontEnd/HeaderAdmin.jsp" var="headAdminURL" scope="application" />
    <jsp:include page="${headAdminURL}"></jsp:include>
    <title>Cập nhật trạng thái đơn hàng</title>
</head>

<body>
                <div class="col-md-9">
                    <div class="row">
                        <h4>Cập nhật trạng thái đơn hàng</h4>
                    </div>
                    <form:form class="row g-3" action="admin-updateStatusOder" method="post" modelAttribute="orders" onsubmit="return FormValidate();">
                        <div class="col-md-8">
                          <label for="orderId" class="form-label">Mã đơn hàng</label>
                          <span class="text-danger">*</span>
                          <form:input path="orderId" type="text" class="form-control" id="orderId" readonly="true"/>
                          <small class="text-danger" id="errOrderId"></small>
                        </div>
                        <div class="col-md-8">
                            <label for="status" class="form-label">Trạng thái</label>
                            <span class="text-danger">*</span>
                            <form:select path="status" class="form-select" style="height: 37px;" id="status">
                                <form:option value="1">Đang chuẩn bị</form:option>
                                <form:option value="2">Đang giao hàng</form:option>
                                <form:option value="3">Đã hoàn thành</form:option>
                                <form:option value="4">Đã hủy</form:option>
                            </form:select>
                            <small class="text-danger" id="errStatus"></small>
                        </div>
                        <div class="col-md-8">
                          <form:input path="user.id" type="hidden" class="form-control" id="user"/>
                          <small class="text-danger" id="errUser"></small>
                        </div>
                        <div class="col-md-8">
                          <form:input path="orderDate" type="hidden" class="form-control" id="orderDate" readonly="true" />
                          <small class="text-danger" id="errOrderDate"></small>
                        </div>
                        <div class="col-md-8">
                          <form:input path="shipAddress" type="hidden" class="form-control" id="shipAddress"/>
                          <small class="text-danger" id="errShipAddress"></small>
                        </div>
                        <div class="col-md-8">
                          <form:input path="totalPrice" type="hidden" class="form-control" id="totalPrice" />
                          <small class="text-danger" id="errTotalPrice"></small>
                        </div>

                        <div class="col-12">
                          <button type="submit" class="btn btn-primary">Lưu</button>
                          <button type="reset" class="btn btn-primary">Xóa</button>
                        </div>
                      </form:form>
                </div>

    <!-- footter -->
    <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
        © 2023 Object:
        <a class="text-reset fw-bold" href="#">vesion v1.0</a>
    </div>
    <!-- footter end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
    <!-- validate form -->


    <!-- validate form end-->
</body>

</html>