<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<title>Tin nhắn</title>
</head>

<body>
				<div class="col-md-9">
                        <div class="row">
                        <div class="col-md-8">
                        	<div class="row text-center">
                                <h3>Thông tin chi tiết tin nhắn</h3>
                            </div>
                            <div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Người nhắn</div>
                    			<div class="col-md-9 m-auto p-auto">${message.fullName }</div>
							</div>
                            <div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Số điện thoại</div>
                    			<div class="col-md-9 m-auto p-auto">${message.phoneNumber }</div>
							</div>
                            <div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Số điện thoại</div>
                    			<div class="col-md-9 m-auto p-auto">${message.email }</div>
							</div>
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Ngày nhắn</div>
		                    	<div class="col-md-9 m-auto p-auto ">
		                    	    <fmt:formatDate value="${message.messageDate }" pattern="yyyy-MM-dd" />
		                    	</div>
							</div>
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Nội dung</div>
		                    	<div class="col-md-9 m-auto p-auto">
		                    	    <textarea name="" id="" cols="60" rows="5">${message.message }</textarea>
		                    	</div>
							</div>    
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Trạng thái</div>
		                    	<div class="col-md-9 m-auto p-auto" style="border-left: 1px solid black; color: ${message.status == "true" ? "green" : "red"};">
		                    	    ${message.status == "true" ? "Đã phản hồi" : "Chưa phản hồi"}
		                    	</div>
							</div>
                            <div class="row py-2">
                                <div class="col py-4 form-group">
                                    <a href = "admin-repMessage?messId=${message.messId}"><button class="w-100 btn btn-info btn-lg text-white" type="submit">Phản hồi</button></a>
                                </div>
                            </div>
						</div>
				</div>
			</div>
</body>
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