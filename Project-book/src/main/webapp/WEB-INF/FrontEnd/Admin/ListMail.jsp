<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Mail</title>
    <style type="text/css">
    	.productName{
    	color: black;
    	}
    	.productName:hover{
    	color: blue;
        font-weight: bold;
    	}
    	#icon:hover{
    	font-size: 20px;
    	}
    </style>
</head>

<body>

                <div class="col-md-9">
                    <div class="row">
                        <h3 class="text-center ">Nội dung mail tự động</h3>
                    </div>

                    <div class="row text-center bg-info rounded py-2 text-white"
                        style="border-bottom: 1px solid white;">
                        <div class="col-md-3 m-auto" style="border-left: 1px solid white;">Loại mail</div>
                        <div class="col-md-8 m-auto" style="border-left: 1px solid white;">Nội dung</div>
                        <div class="col-md-1 m-auto" style="border-left: 1px solid white;">Hành động</div>
                    </div>
                    <c:forEach items="${listMail }" var = "mail">
	                    <div class="row text-center rounded py-2" style="border-bottom: 1px solid rgb(0, 0, 0);">
	                        <div class="col-md-3 m-auto" style="border-left: 1px solid black;">
	                            <a href="#" class="text-decoration-none productName"> ${mail.mailType }</a>
	                        </div>
	                        <div class="col-md-8 m-auto" style="border-left: 1px solid black;">${mail.mailContent }</div>
	                        <div class="col-md-1 m-auto" style="border-left: 1px solid black;">
	                            <div class="row ">
	                                <div class="col ">
	                                    <a href="admin-preUpdateMail?mailId=${mail.mailId}" title="Sửa nội dung">
	                                        <i class="fa-solid fa-screwdriver-wrench " id="icon"></i>
	                                    </a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                </div>

    </section>
    <!-- body end -->
</body>
    <!-- footter -->
        <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
            © 2023 Object:
            <a class="text-reset fw-bold" href="#">vesion v1.0</a>
        </div>
        <!-- footter end -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
       	</script>


</html>