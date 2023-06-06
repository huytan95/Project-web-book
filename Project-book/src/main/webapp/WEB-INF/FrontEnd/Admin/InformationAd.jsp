<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>Trang thông tin trang web</title>
</head>

<body>
				<div class="col-md-9">
					<div class="row">
						<h3 class="text-center">Thông tin trang web</h3>
						<h5 class="text-center text-danger">${mess}</h5>
					</div>

					<div class="row text-center bg-info rounded py-2 text-white"
						style="border-bottom: 1px solid white;">
						<div class="col-md-2">ID</div>
						<div class="col-md-3" style="border-left: 1px solid white;">Email</div>
						<div class="col-md-2" style="border-left: 1px solid white;">Số
							điện thoại</div>
						<div class="col-md-5" style="border-left: 1px solid white;">Địa chỉ</div>
						
					</div>
					<div class="row text-center rounded py-2"
						style="border-bottom: 1px solid rgb(0, 0, 0);">
						<div class="col-md-2 m-auto">${contact.id }</div>
						<div class="col-md-3 m-auto"
							style="border-left: 1px solid black;">${contact.email }</div>
						<div class="col-md-2 m-auto"
							style="border-left: 1px solid black;">${contact.phone }</div>
						<div class="col-md-5 m-auto"
							style="border-left: 1px solid black;">${contact.address }</div>
					</div>
					<div class="form-group py-3 text-end">
							<a href="admin-preEditInfor?id=${contact.id}"><button type="submit"
									class="btn btn-primary mb-2">Sửa thông tin</button></a>
					</div>
					
					<c:forEach items="${listImageInfors }" var="image">
					<div class="row text-center rounded py-3 my-3"
						style="border-bottom: 1px solid rgb(0, 0, 0);">
                        <div class="col-md-2 d-flex justify-content-center bg-info">
                            <div class="m-auto text-white">${image.imageType}</div>
                        </div>
                        <div class="col-md-8">
                            <img class= "img-fluid" alt="${image.imageName}"  src="<c:url value ="sources"/>/img/${image.imageName }">
                        </div>
                        <div class="col-md-2 m-auto p-auto">
                            <div class="form-group py-3 text-end">
                                <button type="submit" class="btn btn-primary mb-2">
                                    <a href="admin-preUpdateImageInfor?id=${image.id}" class = "text-white text-decoration-none">Thay ${image.imageType}</a>
                                </button>
                            </div>
                        </div>	
					</div>
					

					</c:forEach>
				</div>
				<!-- thông tin web end-->

			</div>
		</div>
	</section>
	<!-- body end -->

	<!-- footter -->
	<div class="text-center p-4"
		style="background-color: rgba(0, 0, 0, 0.05);">
		© 2023 Object: <a class="text-reset fw-bold" href="#">vesion v1.0</a>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
</body>
</html>