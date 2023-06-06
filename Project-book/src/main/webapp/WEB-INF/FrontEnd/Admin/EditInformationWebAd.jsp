<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<c:set value="/WEB-INF/FrontEnd/HeaderAdmin.jsp" var="headAdminURL" scope="application" />
    <jsp:include page="${headAdminURL}"></jsp:include>
<title>Giới thiệu</title>
</head>

<body>

				<!-- edit contact-->
				<div class="col-md-9">
					<form:form action="admin-editInformationWeb"  method="post"
						 onsubmit="return FormValidate();"  modelAttribute="infor">
						<div class="row">
							<h2 class="text-center">Chỉnh sửa thông tin trang web</h2>
						</div>
						<h3 style="color:red">${err }</h3>
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-md-8">
								<div class="form-group py-1">
									<label for="id">ID</label>
									<form:input path="id" type="text" class="form-control" id="Id" readonly="true"/> 
									<form:input path="name" type="hidden" class="form-control" id="name" />
									<small class="text-danger"></small>
								</div>
								<div class="form-group py-1">
									<label for="email">Email</label>
									<form:input path="email" type="text" class="form-control" id="email" placeholder="Email"/> 
									<small class="text-danger" id="errEmail"></small>
								</div>
								<div class="form-group py-2">
									<label for="phoneNumber">Số điện thoại</label>
									<form:input path="phone" type="text" class="form-control" id="phoneNumber" placeholder="0..."/>
									<small class="text-danger" id="errPhoneNumber"></small>
								</div>
								<div class="form-group py-2">
									<label for="text">Địa chỉ</label>
									<form:input path="address" type="text" class="form-control" id="address" placeholder=""/>
									<small class="text-danger" id="errAddress"></small>
								</div>
								<div class="form-group py-2">
									<label for="address">Giới thiệu trang web</label>
									<form:textarea path="introduction" name="introduction" id="introduction" class="form-control" rows="5"></form:textarea>
									<small class="text-danger" id="errIntroduction"></small>
								</div>
								<div class="form-group py-3 text-end">
									<button type="submit" value="update" class="btn btn-primary mb-2">Lưu thông tin</button>
								</div>
							</div>
							<div class="col-md-2"></div>
						</div>
					</form:form>
				</div>
				<!-- edit contact end-->

			</div>
		</div>
	</section>
	<!-- body end -->

	<!-- footter -->
	<div class="text-center p-4"
		style="background-color: rgba(0, 0, 0, 0.05);">
		© 2023 Object: <a class="text-reset fw-bold" href="#">vesion v1.0</a>
	</div>
	<!-- footter end -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
	<!-- validate form -->
	<!-- <script src="/sources/js/FormValidate.js"></script> -->
	<script type="text/javascript">
		function FormValidate() {
			var email = document.getElementById('email').value;
			var phoneNumber = document.getElementById('phoneNumber').value;
			var address = document.getElementById('address').value;
			var introduction = document.getElementById('introduction').value;
			
			var errEmail = document.getElementById('errEmail');
			var errPhoneNumber = document.getElementById('errPhoneNumber');
			var errAddress = document.getElementById('errAddress');
			var errIntroduction = document.getElementById('errIntroduction');
			
			var regexName = /^(?!.*\s\s)[^\d+]*[\d+]{0}[^\d+]*$/;
			var regexEmail = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;
			var regesPhone = /^0[0-9]{9}$/;

			//check email
			if (email == '' || email == null) {
				errEmail.innerHTML = "Vui lòng không để trống";
			} else if (!regexEmail.test(email)) {
				errEmail.innerHTML = "Email không hợp lệ";
				email = '';
			} else {
				errEmail.innerHTML = '';
			}
			//check phone number
			if (phoneNumber == '' || phoneNumber == null) {
				errPhoneNumber.innerHTML = "Vui lòng không để trống";
			} else if (!regesPhone.test(phoneNumber)) {
				errPhoneNumber.innerHTML = "Số điện thoại không hợp lệ";
				email = '';
				return false;
			} else {
				errPhoneNumber.innerHTML = '';
			}
			//check address
			if (address == '' || address == null) {
				errAddress.innerHTML = "Vui lòng không để trống";
				return false;
			} else {
				errAddress.innerHTML = '';
			}
			if (introduction == '' || introduction == null) {
				errIntroduction.innerHTML = "Vui lòng không để trống";
				return false;
			} else {
				errIntroduction.innerHTML = '';
			}
			if (firstName && lastName && email && phoneNumber && address && introduction) {
				// Người dùng đã nhập đúng thông tin
				alert("Lưu thông tin thành công");
				return true; //thực hiện việc submit form
			}
	</script>

	<!-- validate form end-->
</body>

</html>