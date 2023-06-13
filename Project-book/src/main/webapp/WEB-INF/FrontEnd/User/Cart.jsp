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
<title>Trang giỏ hàng</title>

<c:set value="/WEB-INF/FrontEnd/Header.jsp" var="headURL" scope="application" />
<jsp:include page="${headURL}"></jsp:include>

</head>

<body>

	<!-- cart -->
	<section class="cart">
		 <div class="container">
                    <div class=" m-auto">
                        <div class="py-3 my-3 row card-header ">
                            <div class="text-center"><strong>SẢN PHẨM ĐÃ CHỌN </strong></div>
                        </div>
                        <div class="row p-0 bg-info text-white fs-5">
                            <div class="p-2 border col-1 text-center">STT</div>
                            <div class="p-2 border col-3 text-center">Tên sản phẩm</div>
                            <div class="p-2 border col-3 text-center">Số lượng</div>
                            <div class="p-2 border col-2 text-center">Đơn giá</div>
                            <div class="p-2 border col-2 text-center">Thành tiền</div>
                            <div class="p-2 border col-1 text-center">Xóa</div>
                        </div>
                        <c:forEach items="${orderDetailList }" var="orderDetail" varStatus="loop">
                            <div class="row p-0 justify-content-center align-items-center">
                                <div class="p-2  col-1 text-center"> ${loop.index + 1}</div>
                                <div class="p-2  col-3 text-center">${orderDetail.product.productName}</div>
                                <div class="p-2 px-5 col-3 text-center">
                                    <div class="product-count px-5">
                                        <form action="#" class="display-flex">

                                            <a href="productMinus?productId=${orderDetail.product.productId}"
                                                class="text-decoration-none text-white qtyminus">-<div class=""></div></a>
                                            <input type="text" name="quantity" value="${orderDetail.quantity}" class="qty" readonly>
                                            <a href="productPlus?productId=${orderDetail.product.productId}"
                                                class="text-decoration-none text-white qtyplus">+<div class=""></div></a>
                                        </form>
                                    </div>
                                </div>
                                <div class="p-2  col-2 text-center">
                                    <fmt:formatNumber value="${orderDetail.unitPrice}" pattern="#,##0đ"/>
                                </div>
                                <div class="p-2  col-2 text-center">
                                    <fmt:formatNumber value="${orderDetail.unitPrice*orderDetail.quantity}" pattern="#,##0đ"/>
                                </div>
                                <div class="p-2  col-1 text-center">
                                    <a href="removeProductCart?productId=${orderDetail.product.productId}"
                                        title="Xóa người dùng" onclick="return confirm('Bạn chắc chắn muốn xóa?')">
                                        <i class="fa-regular fa-trash-can"></i>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="row p-0 bg-info text-white fs-5">
                            <div class="p-2 border col-9 text-center">TỔNG</div>
                            <div class="p-2 border col-2 text-center">
                                <fmt:formatNumber value="${totalPrice}" pattern="#,##0đ"/>
                            </div>
                            <div class="p-2 border col-1 text-center"></div>
                        </div>
                        <div class="row">
                        <c:if test = "${totalProduct != 0}">
                            <a href="preCheckOut"
                               class="p-2 text-end"> <div><button type="button" class="btn btn-danger">Đặt hàng</button></div></a>
                        </c:if>
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

</body>

</html>