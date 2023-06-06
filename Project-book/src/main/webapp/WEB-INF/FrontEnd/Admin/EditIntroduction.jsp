<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<c:set value="/WEB-INF/FrontEnd/HeaderAdmin.jsp" var="headAdminURL" scope="application" />
<jsp:include page="${headAdminURL}"></jsp:include>
<title>Giới thiệu</title>
</head>

<body>
				<!-- edit contact-->
				<div class="col-md-9">
					<form:form action="admin-editIntroduction"  method="post"
						 onsubmit="return FormValidate();"  modelAttribute="introduction">
						<div class="row">
							<h2 class="text-center">Chỉnh sửa giới thiệu trang web</h2>
						</div>
						<h3 style="color:red">${err }</h3>
						<div class="row">
								<div class="form-group py-1">
									<label for="id">ID</label>
									<form:input path="id" type="text" class="form-control" id="Id" readonly="true"/> 
									<form:input path="name" type="hidden" class="form-control" id="name" />
									<form:input path="email" type="hidden" class="form-control" id="email" placeholder="Email"/>
									<form:input path="phone" type="hidden" class="form-control" id="phoneNumber" placeholder="0..."/>
									<form:input path="address" type="hidden" class="form-control" id="address" placeholder=""/>
									<form:input type="hidden" path="policy" name="policy" id="policyContent" class="form-control" rows="10" ></form:input>
								</div
								<div class="form-group py-2"  style="width: 500px;">
									<label for="introduction"><h5>Giới thiệu trang web</h5></label>
									<form:textarea  maxlength = "2000" path="introduction" name="introduction" id="IntroductionContent" class="form-control" rows="10"></form:textarea>
									<small class="text-danger" id="errIntroduction"></small>
								</div>
								<div class="form-group py-3 text-end">
									<button type="submit" value="update" class="btn btn-primary mb-2">Lưu thông tin</button>
								</div>
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
			var introduction = document.getElementById('IntroductionContent');
			
			var errIntroduction = document.getElementById('errIntroduction');
			
			if (introduction == '' || introduction == null) {
				errIntroduction.innerHTML = "Vui lòng không để trống";
				return false;
			} else {
				errIntroduction.innerHTML = '';
			}
			if (introduction) {
				// Người dùng đã nhập đúng thông tin
				alert("Lưu thông tin thành công");
				return true; //thực hiện việc submit form
			}
		}
	</script>
<script>
	function maxLength(el) {	
		if (!('maxLength' in el)) {
			var max = el.attributes.maxLength.value;
			el.onkeypress = function () {
				if (this.value.length >= max) return false;
			};
		}
	}
	maxLength(document.getElementById("IntroductionContent"));
</script>
	<!-- validate form end-->
<script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
    <script>
     var editor = CKEDITOR.replace('IntroductionContent', {
            width: '1000px'
        });
    </script>
</body>

</html>