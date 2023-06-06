<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<title>Trang đăng nhập</title>
<c:set value="/WEB-INF/FrontEnd/Header.jsp" var="headURL" scope="application" />
<jsp:include page="${headURL}"></jsp:include>
</head>

<body>


	<!-- register -->
	<section>

		<div class="container py-5 h-100">
			<div class="row justify-content-center align-items-center h-100">
				<div class="col-12 col-lg-9 col-xl-7">
					<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<div class="card-body p-4 p-md-5">
							<h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center">Đăng ký tài khoản</h3>
							<h4 class="text-danger">${err}</h4>
							<form:form action="insertUser" modelAttribute="user" onsubmit="return FormValidate();" method="post">
								<div class="row">
									<div class="col-md-6 mb-2 pb-2">
										<div class="form-outline">
											<label for="fullName" class="col-form-label">Họ và tên</label> 
											<form:input type="text" path ="fullName" id="fullName" class="form-control form-control-lg" />
											<small class="text-danger" id="errFullName"></small>
										</div>
									</div>
									<div class="col-md-6 mb-2 pb-2">
										<div class="form-outline">
											<label for="userName" class="col-form-label">Tên đăng nhập</label>
											<form:input type="text" path="userName" id="userName" class="form-control form-control-lg" />
											<small class="text-danger" id="errUserName"></small>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mb-2">
										<div class="form-outline">
											<label for="password" class="col-form-label">Mật khẩu</label>
											<form:input path="password" type="password" id="password" class="form-control form-control-lg"/>
											<small class="text-danger" id="errPassword"></small>
										</div>
									</div>
									<div class="col-md-6 mb-2">
										<div class="form-outline">
											<label for="rePassword" class="col-form-label">Nhập lại mật khẩu</label>
											<input  type="password" id="rePassword" class="form-control form-control-lg"/>
											<small class="text-danger" id="errRePassword"></small>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mb-2 pb-2">
										<div class="form-outline">
											<label for="email" class="col-form-label">Địa chỉ email</label>
											<form:input path="email" type="email" id="email" placeholder="you@example.com" class="form-control form-control-lg"/>
											<small class="text-danger" id="errEmail"></small>
										</div>
									</div>
									<div class="col-md-6 mb-2 pb-2">
										<div class="form-outline">
											<label for="phoneNumber" class="col-form-label">Số điện thoại</label>
											<form:input path="phoneNumber" type="tel" id="phoneNumber" placeholder="0..." class="form-control form-control-lg"/>
											<small class="text-danger" id="errPhoneNumber"></small>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-6 mb-2 d-flex align-items-center">
										<div class="form-outline datepicker w-100">
											<label for="birthday" class="form-label">Ngày tháng năm sinh</label>
											<form:input path="birthday" class="form-control form-control-lg" id="birthday"/>
											<small class="text-danger" id="errBirthday"></small>
										</div>

									</div>
									<div class="col-md-6 mb-2">
										<h6 class="mb-2">Giới tính:</h6>
										<div class="form-check form-check-inline my-2">
											<form:radiobutton class="form-check-input" path="gender" name="inlineRadioOptions" id="femaleGender"
												   value="false" />
											<label class="form-check-label" for="femaleGender">Nữ</label>
										</div>

										<div class="form-check form-check-inline">
											<form:radiobutton class="form-check-input" path="gender" name="inlineRadioOptions" id="maleGender"
													value="true" />
											<label class="form-check-label" for="maleGender">Nam</label>
										</div>
									</div>
								</div>
								<div class="row m-auto p-auto pb-4">
										<label for="address" class="col-form-label">Địa chỉ</label>
										<form:input path="address" type="text" id="address" class="form-control form-control-lg"/>
										<small class="text-danger" id="errAddress"></small>
								</div>
								<div class="row m-auto p-auto">
									<input class="btn btn-primary btn-lg" type="submit" value="Đăng ký" />
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- register end -->

	<!-- Footer -->
        <c:set value="/WEB-INF/FrontEnd/Footer.jsp" var="footerURL" scope="application" />
        <jsp:include page="${footerURL}"></jsp:include>
    <!-- Footer end-->


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
	<script type="text/javascript" src="<c:url value="/sources/js/FormValidate.js" />">	</script>
</body>

</html>