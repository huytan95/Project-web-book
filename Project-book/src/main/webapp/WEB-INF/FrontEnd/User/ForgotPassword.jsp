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
                    <form action="checkUser" onsubmit="return FormValidate();">
                        <div class="card text-center  m-auto p-auto" style="width: 400px;">
                            <h4 class = "text-danger">${err}</h4>
                            <div class="card-header h5 text-white bg-primary">Password Reset</div>
                            <div class="card-body px-5">
                                <p class="card-text py-2">
                                    Nhập tài khoản của bạn và chúng tôi sẽ gửi một email với
                                    hướng dẫn để đặt lại mật khẩu của bạn.
                                </p>
                                <div class="form-outline">
                                    <input type="text" id="userName" name="userName"  class="form-control" placeholder="User name..."/>
                                    <small class="text-danger" id="errUserName"></small>
                                </div>
                                <input class="btn btn-primary w-100 my-3" type="submit" value="Send mail" />
                                <div id="hover" class="d-flex justify-content-between mt-4">
                                    <a class="text-decoration-none " href="login">Login</a>
                                    <a class="text-decoration-none " href="register">Register</a>
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
<script>
        function FormValidate() {
	        var userName = document.getElementById('userName');

            var errUserName = document.getElementById('errUserName');

            //check birthday
	        if (userName.value == '' || userName.value == null) {
                userName.classList.add("input-error");
                errUserName.innerHTML = "Vui lòng không để trống";
		        return false;
	     } else {
                userName.classList.remove("input-error");
                errUserName.innerHTML = '';
	        }
         }
    </script>
</body>

</html>