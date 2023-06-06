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
			<div class="row py-1 bg-light" >
				<div class="row d-inline mx-1">
					<a href="home" class="text-decoration-none text-reset p-0">Trang chủ</a>
					<a href="introduction" class="text-decoration-none text-reset p-0">/Giới thiệu</a>	
				</div>
			</div>
			
			<!-- introduce -->
			<div class="row py-2 ">
                <h2>Chính sách</h2>
               ${contact.policy }

            </div>
				
			<!-- introduce end-->

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
</body>

</html>