<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<c:set value="/WEB-INF/FrontEnd/HeaderAdmin.jsp" var="headAdminURL" scope="application" />
<jsp:include page="${headAdminURL}"></jsp:include>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <title>Chi tiết đơn hàng</title>
    <style type="text/css">
    	.productName{
    	color: black;
    	}
    	.productName:hover{
    	color: blue;
        font-weight: bold;
    	}
    	#icon:hover{
    	font-size: 20px;
    	}
    </style>
</head>

<body>
                <div class="col-md-9">
                    <div class="row">
                        <h3 class="text-center ">Danh sách sản phẩm</h3>
                    </div>
                    <div class="row py-1 ">
                        <div class="col-md-9">
                            <!-- tìm kiếm sản phẩm -->
                            <form action="admin-searchOrderById" method="get">
                                <div class="input-group">
                                    <input type="text" class="form-control" value ="" placeholder="Tìm kiếm đơn hàng" name = "orderId">
                                    <button type="submit" class="btn btn-primary"><i class="fa-sharp fa-solid fa-magnifying-glass"></i></button>
                                </div>
                            </form>
                            <!-- tìm kiếm sản phẩm end-->
                        </div>
                    </div>
                    <div class="row text-center bg-info rounded py-2 text-white"
                        style="border-bottom: 1px solid white;">
                        <div class="col-md-2 m-auto">STT</div>
                        <div class="col-md-4 m-auto" style="border-left: 1px solid white;">Tên sản phẩm</div>
                        <div class="col-md-2 m-auto" style="border-left: 1px solid white;">Số lượng</div>
                        <div class="col-md-2 m-auto" style="border-left: 1px solid white;">Đơn giá</div>
                        <div class="col-md-2 m-auto" style="border-left: 1px solid white;">Thành tiền</div>
                    </div>
                    <c:forEach items="${orderDetailList }" var = "orderDetail" varStatus="loop">
	                    <div class="row text-center rounded py-2" style="border-bottom: 1px solid rgb(0, 0, 0);">
	                        <div class="col-md-2 m-auto" style="border-left: 1px solid black;">${loop.index + 1 } </div>
	                        <div class="col-md-4 m-auto" style="border-left: 1px solid black;">${orderDetail.product.productName }</div>
	                        <div class="col-md-2 m-auto" style="border-left: 1px solid black;">${orderDetail.quantity }</div>
	                        <div class="col-md-2 m-auto" style="border-left: 1px solid black;">${orderDetail.unitPrice }</div>
                            <div class="col-md-2 m-auto" style="border-left: 1px solid black;">${orderDetail.unitPrice *orderDetail.quantity }</div>

	                    </div>
                    </c:forEach>
                    <div class="row p-0 bg-info text-white fs-5">
                        <div class="p-2 border col-10 text-center">TỔNG</div>
                        <div class="p-2 border col-2 text-center">${totalPrice}</div>
                    </div>
                    <div class="row">
                        <a href="admin-listOderAdmin"
                           class="p-2 text-end"> <div><button type="button" class="btn btn-danger">Quay về</button></div>
                        </a>
                    </div>
                </div>
    </section>
    <!-- body end -->

    <!-- footter -->
    <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
        © 2023 Object:
        <a class="text-reset fw-bold" href="#">vesion v1.0</a>
    </div>
    <!-- footter end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
   	</script>
</body>

</html>