<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

	<!--  Product Cards -->
        <section>
            <div class="container">
                <div class="py-5 text-center text-primary">
                    <h2>Thông tin thanh toán</h2>
                </div>
                <div class="row g-5">
                    <div class="col-md-5 col-lg-4 order-md-last">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-primary">Giỏ hàng</span>
                            <span class="badge bg-primary rounded-pill">${totalQuantity}</span>
                        </h4>
                        <form class="card p-2">
                            <ul class="list-group mb-3">
                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                    <div>
                                        <h6 class="my-0">Tiền hàng</h6>
                                    </div>
                                    <span class="text-muted">${totalPrice}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                    <div>
                                        <h6 class="my-0">Phí vận chuyển</h6>
                                    </div>
                                    <span class="text-muted">${shipPrice}</span>
                                </li>

                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">Mã giảm giá</h6>
                                        <span>None</span>
                                    </div>
                                    <span class="text-success">---</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>Tổng tiền</span>
                                    <strong>${totalPriceOrder}</strong>
                                </li>
                            </ul>

                        </form>
                    </div>
                    <div class="col-md-7 col-lg-8">
                        <h4 class="mb-3">Địa chỉ nhận hàng</h4>
                        <form:form name="checkOut" action="checkOut" method="post" onsubmit="return FormValidate();" modelAttribute="user">
                            <div class="row g-3">

                                <div class="form-group col-sm-12">
                                    <label for="fullName">Họ và tên</label>
                                    <span class="text-danger">*</span>
                                    <form:input path="fullName" type="text" class="form-control" id="fullName" />
                                    <small class="text-danger" id="errFullName"></small>
                                </div>
                                <div class="col-12 form-group">
                                    <label for="email">Email </label>
                                    <span class="text-danger">*</span>
                                    <form:input path="email" type="text" class="form-control" id="email"/>
                                    <small class="text-danger" id="errEmail"></small>
                                </div>
                                <div class="col-12 form-group">
                                    <label for="phoneNumber">Số điện thoại </label>
                                    <span class="text-danger">*</span>
                                    <form:input path="phoneNumber" type="text" class="form-control" id="phoneNumber"/>
                                    <small class="text-danger" id="errPhoneNumber"></small>
                                </div>
                                <div class="col-12 form-group">
                                    <label for="address">Địa chỉ nhận hàng </label>
                                    <span class="text-danger">*</span>
                                    <form:textarea path="address" name="address" id="address" class="form-control w-100"
                                        rows="3"/>
                                    <small class="text-danger" id="errAddress"></small>
                                </div>
                            </div>
                            <div class="col py-4 form-group">
                                <button class="w-100 btn btn-info btn-lg text-white" type="submit">Gửi đơn hàng</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </section>
        <!--  Product Cards end -->

	<!-- Footer -->
        <c:set value="/WEB-INF/FrontEnd/Footer.jsp" var="footerURL" scope="application" />
        <jsp:include page="${footerURL}"></jsp:include>
    <!-- Footer end-->


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
	<script type="text/javascript" src="<c:url value="/sources/js/CheckOut.js" />"> </script>

</body>

</html>