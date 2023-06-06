<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
    	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
    	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
    	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<html lang="en">
<c:set value="/WEB-INF/FrontEnd/HeaderAdmin.jsp" var="headAdminURL" scope="application" />
<jsp:include page="${headAdminURL}"></jsp:include>
<head>
    <title>Danh sách đơn hàng</title>
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
                        <h5 class="text-center text-danger">${mess}</h5>
                    </div>
                    <div class="row py-1 ">
                        <div class="col-md-9">
                            <!-- tìm kiếm sản phẩm -->
                            <form action="admin-searchOrderById" method="get">
                                <div class="input-group">
                                    <input type="text" class="form-control" value ="" placeholder="Mã đơn hàng" name = "orderId">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
                                    </button>
                                </div>
                            </form>
                            <!-- tìm kiếm sản phẩm end-->
                        </div>
                    </div>
                    <div class="row text-center bg-info rounded py-2 text-white"
                        style="border-bottom: 1px solid white;">
                        <div class="col-md-3 m-auto">Tên người mua</div>
                        <div class="col-md-3 m-auto" style="border-left: 1px solid white;">Ngày đặt hàng</div>
                        <div class="col-md-2 m-auto" style="border-left: 1px solid white;">Tổng tiền</div>
                        <div class="col-md-1 m-auto" style="border-left: 1px solid white;">Mã đơn hàng</div>
                        <div class="col-md-2 m-auto" style="border-left: 1px solid white;">Trạng thái đơn hàng</div>
                        <div class="col-md-1 m-auto" style="border-left: 1px solid white;">Hành động</div>
                    </div>
                    <c:forEach items="${ordersList}" var = "order">
	                    <div class="row text-center rounded py-2" style="border-bottom: 1px solid rgb(0, 0, 0);">
	                        <div class="col-md-3 m-auto" style="border-left: 1px solid black;">${order.user.fullName} </div>
	                        <div class="col-md-3 m-auto" style="border-left: 1px solid black;">
	                            <fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" />
	                        </div>
	                        <div class="col-md-2 m-auto" style="border-left: 1px solid black;">
	                            <fmt:formatNumber value="${order.totalPrice}" pattern="#,##0đ"/>
	                       </div>
	                        <div class="col-md-1 m-auto" style="border-left: 1px solid black;">
	                             <a href="admin-orderDetailAdmin?orderId=${order.orderId }" class="text-decoration-none productName"> ${order.orderId}</a>
	                        </div>
                                <c:choose>
                                    <c:when test="${order.status == 1}">
                                         <div class="col-md-2 m-auto text-warning" style="border-left: 1px solid black;">
                                            Đang chuẩn bị
                                         </div>
                                    </c:when>
                                    <c:when test="${order.status == 2}">
                                         <div class="col-md-2 m-auto text-info" style="border-left: 1px solid black;">
                                               Đang giao hàng
                                         </div>
                                    </c:when>
                                    <c:when test="${order.status == 3}">
                                        <div class="col-md-2 m-auto text-success" style="border-left: 1px solid black;">
                                               Đã hoàn thành
                                         </div>
                                    </c:when>
                                    <c:otherwise>
                                         <div class="col-md-2 m-auto text-danger" style="border-left: 1px solid black;">
                                               Đơn đã hủy
                                         </div>
                                    </c:otherwise>
                                </c:choose>

	                        <div class="col-md-1 m-auto" style="border-left: 1px solid black;">
	                            <div class="row ">
	                                <div class="col-md-6 "><a href="admin-preUpdateStatusOrder?orderId=${order.orderId }" title="Cập nhật trạng thái đơn hàng">
	                                    <i class="fa-solid fa-screwdriver-wrench" id="icon"></i></a></div>

	                                <div class="col-md-6"><a href="admin-orderDetailAdmin?orderId=${order.orderId }" title="Chi tiết đơn hàng">
	                                    <i class="fa-solid fa-circle-info"id="icon"></i></a></div>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                    <div class="row p-2">
						<nav aria-label="...">
					        <ul class="pagination justify-content-center">
					            <li class="page-item">
					                <a class="page-link" href="admin/admin-listOderAdmin?page=${previous}">Previous</a>
					            </li>
					            <c:forEach items="${listPage}" var="page">
					                <li class="page-item pageLink">
					                    <a class="page-link" href="admin-listOderAdmin?page=${page}">${page}</a>
					                </li>
					            </c:forEach>
                                    <li class="page-item ">
                                        <a class="page-link" href="admin-listOderAdmin?page=${next}">Next</a>
                                </li>
					        </ul>
					   </nav>
					</div>
                </div>
    <!-- body end -->

    <!-- footter -->

</body>
<div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
        © 2023 Object:
        <a class="text-reset fw-bold" href="#">vesion v1.0</a>
</div>
    <!-- footter end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
   	</script>
</html>