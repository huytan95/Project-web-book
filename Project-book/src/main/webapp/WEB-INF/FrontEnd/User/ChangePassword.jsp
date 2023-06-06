<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="<c:url value="/sources/css/scroll.css" />" rel="stylesheet" type="text/css" />
<title>Trang chủ</title>


<c:set value="/WEB-INF/FrontEnd/Header.jsp" var="headURL" scope="application" />
<jsp:include page="${headURL}"></jsp:include>

</head>

<body>
	<section class="bodycontent">
		<div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6 py-3">
                    <form action="ChangePassword" onsubmit="return FormValidate();">
                        <div class="card text-center  m-auto p-auto" style="width: 400px;">
                            <div class="card-header h5 text-white bg-primary">Change password</div>
                            <div class="card-body px-5">
                                <p class="card-text py-2">
                                    Nhập mật khẩu mới của bạn, mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường
                                    và ký tự đặc biệt
                                </p>
                                <div class="form-outline">
                                    <input type="password" id="password" name="password" class="form-control" placeholder="Mật khẩu mới"/>
                                    <small class="text-danger" id="errPassword"></small>
                                </div>
                                <div class="form-outline mt-3">
                                    <input type="password" id="confirmPassword" class="form-control" placeholder="Nhập lại mật khẩu"/>
                                    <small class="text-danger" id="errConfirmPassword"></small>
                                </div>
                                <input class="btn btn-primary w-100 my-3" type="submit" value="Lưu" />
                                <div id="hover" class="d-flex justify-content-between mt-4">
                                    <a class="text-decoration-none " href="#">Login</a>
                                    <a class="text-decoration-none " href="#">Register</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            <div class="col-md-3"></div>
	</section>
	<!-- Footer -->
        <c:set value="/WEB-INF/FrontEnd/Footer.jsp" var="footerURL" scope="application" />
        <jsp:include page="${footerURL}"></jsp:include>
    <!-- Footer end-->
	<a href="#" class="cd-top"><i
		class="fa-solid fa-arrow-up-from-bracket"></i></a>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>

	<!-- back to top -->
	    <script type="text/javascript" src="<c:url value="/sources/js/scroll.js" />"> </script>
    <!-- back to top end-->
    <!-- Validate -->
        <script type="text/javascript" src="<c:url value="/sources/js/changePassword.js" />"> </script>
    <!-- Validate end-->

</body>

</html>