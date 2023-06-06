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
<title>Thay đổi thông tin tài khoản</title>

<c:set value="/WEB-INF/FrontEnd/Header.jsp" var="headURL" scope="application" />
<jsp:include page="${headURL}"></jsp:include>

</head>

<body>

	<!-- cart -->
	<section class="cart">
		 <div class="container">
            <div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="py-3 my-3 row card-header ">
                        <div class="text-center"><strong>THAY ĐỔI THÔNG TIN </strong></div>
                    </div>
				<form:form action="updateInforUser" method="post" modelAttribute="user" onsubmit="return FormValidate();">
					<div class="row">
						<div class="form-group pt-2">
							<label for="userName">Tên đăng nhập</label>
							<span class="text-danger">*</span>
							<form:input type="text" path="userName" class="form-control border-secondary" id="userName" name="userName"/>
							<form:input type="hidden" path="id" class="form-control border-secondary" id="id" name="id"/>
							<small class="text-danger" id="errUserName"></small>
						</div>
						<div class="form-group pt-3">
							<form:input  type="hidden" path="password" class="form-control border-secondary" id="password" name="password"/>
							<small class="text-danger" id="errPassword"></small>
						</div>
						<div class="form-group pt-3">
							<label for="fullName">Họ và tên</label>
							<span class="text-danger">*</span>
							<form:input type="text" path="fullName" class="form-control border-secondary" id="fullName" name="fullName"/>
							<small class="text-danger" id="errFullName"></small>
						</div>
						 <div class="form-group pt-3">
							<label for="gender">Giới tính</label>
							<span class="text-danger">*</span>
							<br>
							<form:radiobutton path="gender" id="gender" name="gender" value="true"/> Nam
							<form:radiobutton path="gender"  id="gender" name="gender" value="false"/> Nữ
							<small class="text-danger" id="errGender"></small>
						</div>
						<div class="form-group pt-3">
							<label for="birthday">Ngày tháng năm sinh</label>
							<span class="text-danger">*</span>
							<form:input path="birthday" class="form-control border-secondary" id="birthday" name="birthday"/>
							<small class="text-danger" id="errBirthday"></small>
						</div>
						<div class="form-group pt-3">
							<label for="address">Địa chỉ</label>
							<span class="text-danger">*</span>
							<form:input path="address" class="form-control border-secondary" id="address" name="address"/>
							<small class="text-danger" id="errAddress"></small>
						</div>
						<div class="form-group pt-3">
							<label for="email">Email</label>
							<span class="text-danger">*</span>
							<form:input path="email" class="form-control border-secondary" id="email" name="email"/>
							<small class="text-danger" id="errEmail"></small>
						</div>
						<div class="form-group pt-3">
							<label for="phoneNumber">Số điện thoại</label>
							<span class="text-danger">*</span>
							<form:input path="phoneNumber" class="form-control border-secondary" id="phoneNumber" name="phoneNumber"/>
							<small class="text-danger" id="errPhoneNumber"></small>
						</div>
						<div class="form-group pt-3">
							<form:input type="hidden" path="enabled" class="form-control border-secondary" id="enabled" name="enabled" readonly="true"/>
							<small class="text-danger" id="errEnable"></small>
						</div>
						 <div class="form-group pt-3">
							<form:input type="hidden" path="userRoles.role" class="form-control border-secondary"  id="userRoles" name="userRoles" readonly="true"/>
							<small class="text-danger" id="errUserRoles"></small>
						</div>
						<div class="row py-3">
							<div class="col-md-9"></div>
							<div class="col-md-3">
								<button type="submit" class="btn btn-primary mb-2">Lưu thông tin</button>
							</div>
						</div>
					</div>
					</form:form>
				</div>
				</div>
				<div class="col-md-2"></div>
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
<!-- Validate -->
        <script type="text/javascript" src="<c:url value="/sources/js/UpdateInforUser.js" />"> </script>
<!-- Validate end-->

</body>

</html>