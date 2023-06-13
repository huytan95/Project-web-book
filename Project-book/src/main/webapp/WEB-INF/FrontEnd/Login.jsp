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
<title>Trang đăng nhập</title>
<c:set value="/WEB-INF/FrontEnd/Header.jsp" var="headURL" scope="application" />
<jsp:include page="${headURL}"></jsp:include>
</head>

<body>

	<!-- Login -->
	<section class="formLogin">
		<div class="container ">
			<div class="row py-5">
				<div class="col-md-3"></div>
				<div class="col-md-1"></div>
				<div class="col-md-4">
					<h3 class="text-center">Đăng nhập</h3>
					<h5 class="text-center text-danger" name="err">${err}</h5>
					<h5 class="text-center text-success" name="success">${success}</h5>
					<form name='loginForm' action="login" method="POST">
						<!-- username input -->
						<div class="form-outline mb-4">
							<input type="text" id="form2Example1" name="username" class="form-control" value="${cookie.usernameCookie.value}" required/>
							<label class="form-label" for="form2Example1">Tên đăng nhập</label>
						</div>

						<!-- Password input -->
						<div class="form-outline mb-4">
							<input type="password" id="form2Example2" name ="password" class="form-control" value="${cookie.passwordCookie.value}" required/>
							<label class="form-label" for="form2Example2">Mật khẩu</label>
						</div>

						<div class="row mb-4">
							<div class="col d-flex justify-content-center">
								<!-- Checkbox -->
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="On" id="form2Example31" name = "remember" />
									<label class="form-check-label" for="form2Example31"> Ghi nhớ mật khẩu </label>
								</div>
							</div>

							<div class="col">
								<!-- Simple link -->
								<a href="ForgotPassword">Quyên mật khẩu?</a>
							</div>
						</div>

						<!-- Submit button -->
						<div>
							<button type="submit" style="width: 100%;"
								class="btn btn-primary btn-block mb-4">Đăng nhập</button>
						</div>

						<!-- Register buttons -->
						<div class="text-center">
							<p>
								Bạn chưa có tài khoản? <a href="register">Đăng ký ngay</a>
							</p>

						</div>
					</form>
				</div>
				<div class="col-md-4"></div>
			</div>
		</div>
	</section>
	<!-- Login end -->

	<!-- Footer -->
        <c:set value="/WEB-INF/FrontEnd/Footer.jsp" var="footerURL" scope="application" />
        <jsp:include page="${footerURL}"></jsp:include>
    <!-- Footer end-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
</body>

</html>