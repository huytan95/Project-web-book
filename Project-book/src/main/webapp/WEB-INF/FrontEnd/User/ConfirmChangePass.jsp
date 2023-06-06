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
<title>Thay đổi mật khẩu</title>
<c:set value="/WEB-INF/FrontEnd/Header.jsp" var="headURL" scope="application" />
<jsp:include page="${headURL}"></jsp:include>
</head>

<body>

	<!-- Login -->
	<section class="bodycontent">
    		<div class="container">
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6 py-3">
                        <form action="ChangePasswordUser" onsubmit="return FormValidate();">
                            <div class="card text-center  m-auto p-auto" style="width: 400px;">
                                <h4 class = "text-danger">${err}</h4>
                                <div class="card-header h5 text-white bg-primary">Password Reset</div>
                                <div class="card-body px-5">
                                    <div class="form-outline py-2">
                                        <input type="password" id="oldPassword" name="oldPassword"  class="form-control" placeholder="Mật khẩu"/>
                                        <small class="text-danger" id="errOldPassword"></small>
                                    </div>
                                    <div class="form-outline py-2">
                                        <input type="password" id="password" name="password"  class="form-control" placeholder="Mật khẩu mới"/>
                                        <small class="text-danger" id="errPassword"></small>
                                    </div>
                                    <div class="form-outline py-2">
                                        <input type="password" id="confirmPassword" name="confirmPassword"  class="form-control" placeholder="Nhập lại mật khẩu mới"/>
                                        <small class="text-danger" id="errConfirmPassword"></small>
                                    </div>
                                    <input class="btn btn-primary w-100 my-3" type="submit" value="Lưu" />
                                    <div id="hover" class="d-flex justify-content-between mt-4">
                                        <a class="text-decoration-none " href="home">Quay lại</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                <div class="col-md-3"></div>


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
<!-- Validate -->
        <script type="text/javascript" src="<c:url value="/sources/js/ConfirmChangePass.js" />"> </script>
<!-- Validate end-->
</body>

</html>