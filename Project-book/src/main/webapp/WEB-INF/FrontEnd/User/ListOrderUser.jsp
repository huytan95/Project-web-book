<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/css/style.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<link href="<c:url value="/sources/css/Cart.css" />" rel="stylesheet" type="text/css" />
<title>Lịch sử mua hàng</title>

<c:set value="/WEB-INF/FrontEnd/Header.jsp" var="headURL" scope="application" />
<jsp:include page="${headURL}"></jsp:include>
<style type="text/css">
	.ellipsify {
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    max-width: 100%;
    display: inline-block;
}
.status-1 {
    background-color: green;
}

.status-2 {
    background-color: yellow;
}

.status-3 {
    background-color: blue;
}

.status-4 {
    background-color: red;
}
</style>
</head>

<body>

	<!-- cart -->
	<section>
            <div class="container">
                <div class=" m-auto">
                    <div class="py-3 my-3 row card-header ">
                        <div class="text-center"><strong>LỊCH SỬ MUA HÀNG </strong></div>
                        <h5 class = "text-danger text-center">${message}</h5>
                    </div>
                    <div class="row p-0 bg-info text-white fs-5 d-flex align-items-center justify-content-center" >
                        <div class="p-2  col-1 text-center" style="border-left: 1px solid white;">Mã đơn hàng</div>
                        <div class="p-2  col-2 text-center" style="border-left: 1px solid white;">Ngày đặt Hàng</div>
                        <div class="p-2  col-4 text-center" style="border-left: 1px solid white;">Địa chỉ</div>
                        <div class="p-2  col-2 text-center" style="border-left: 1px solid white;">Trạng thái</div>
                        <div class="p-2  col-2 text-center" style="border-left: 1px solid white;">Tổng tiền</div>
                        <div class="p-2  col-1 text-center" style="border-left: 1px solid white;">Hành động</div>
                    </div>
                    <div class="row p-0">
                        <c:forEach items="${ordersList }" var="orders">
                            <div class="p-3 border col-1 text-center">${orders.orderId}</div>
                            <div class="p-3 border col-2 text-center">
                                <fmt:formatDate value="${orders.orderDate}" pattern="dd-MM-yyyy" />
                            </div>
                            <div class="p-2 border col-4 text-center ellipsify"> ${orders.shipAddress}</div>

                                <c:choose>
                                    <c:when test="${orders.status == 1}">
                                     <div class="p-3 border col-2 text-center text-warning">
                                        Đang chuẩn bị
                                         </div>
                                    </c:when>
                                    <c:when test="${orders.status == 2}">
                                         <div class="p-3 border col-2 text-center text-info">
                                               Đang giao hàng
                                         </div>
                                    </c:when>
                                    <c:when test="${orders.status == 3}">
                                        <div class="p-3 border col-2 text-center text-success">
                                               Đã hoàn thành
                                         </div>
                                    </c:when>
                                    <c:otherwise>
                                         <div class="p-3 border col-2 text-center text-danger">
                                               Đơn đã hủy
                                         </div>
                                    </c:otherwise>
                                </c:choose>

                            <div class="p-3 border col-2 text-center">
                                <fmt:formatNumber value="${orders.totalPrice}" pattern="#,##0đ"/>
                            </div>
                            <div class="p-3 border col-1 text-center">
                                <div class="row ">
                                    <c:choose>
                                        <c:when test="${orders.status == 1}">
                                            <div class="col-md-6">
                                                <a href="orderDetailUser?orderId=${orders.orderId}" title="Chi tiết đơn hàng"><i class="fa-solid fa-circle-info"></i></a>
                                            </div>
                                            <div class="col-md-6">
                                                <a href="disable?orderId=${orders.orderId}" title="Hủy đơn hàng" onclick="return confirm('Bạn chắc chắn muốn hủy?')"><i class="fa-solid fa-trash"></i></a>
                                            </div>
                                        </c:when>
                                        <c:when test="${orders.status == 2 || orders.status == 3}">
                                            <div class="col-md-12">
                                                <a href="orderDetailUser?orderId=${orders.orderId}" title="Chi tiết đơn hàng"><i class="fa-solid fa-circle-info"></i></a>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-md-4 "> </div>
                                            <div class="col-md-4"> </div>
                                            <div class="col-md-4">  </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="row p-2">
						<nav aria-label="...">
					        <ul class="pagination justify-content-center">
					            <li class="page-item">
					                <a class="page-link" href="listOder?page=${previous}">Previous</a>
					            </li>
					            <c:forEach items="${listPage}" var="page">
					                <li class="page-item pageLink">
					                    <a class="page-link" href="listOder?page=${page}">${page}</a>
					                </li>
					            </c:forEach>
                                    <li class="page-item ">
                                        <a class="page-link" href="listOder?page=${next}">Next</a>
                                    </li>
					        </ul>
					   </nav>
					</div>

                </div>

            </div>
        </section>
	<!-- cart end -->

	<!-- Footer -->
        <c:set value="/WEB-INF/FrontEnd/Footer.jsp" var="footerURL" scope="application" />
        <jsp:include page="${footerURL}"></jsp:include>
    <!-- Footer end-->


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
	<script type="text/javascript" src="<c:url value="/sources/js/Cart.js" />"> </script>
    <script type="text/javascript">
            document.querySelectorAll('.ellipsify').forEach(function (e) {
            if (e.offsetWidth < e.scrollWidth) {
                e.setAttribute('title', e.textContent);
            } else{
                e.removeAttribute('title');
            }
            });
    </script>

</body>

</html>