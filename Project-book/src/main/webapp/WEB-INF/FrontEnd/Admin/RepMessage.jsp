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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                            <form action= "admin-sendMail" onsubmit="return FormValidate();">
                                <div class="row border py-2">
                                    <div class="form-group">
                                        <label for="productName">Người nhận</label>
                                        <span class="text-danger">*</span>
                                        <input type="text" name = "sendTo" class="form-control border-secondary" id="name" name="name"
                                            value="${message.email}" readonly="true"/>
                                        <input type="hidden" name = "messId" class="form-control border-secondary" id="messId" name="messId"
                                            value="${message.messId}" readonly="true"/>
                                        <small class="text-danger" id="errName"></small>
                                    </div>
                                </div>
                                <div class="row border py-2">
                                    <div class="form-group">
                                        <label for="title">Chủ đề</label>
                                        <span class="text-danger">*</span>
                                        <input type="text" name = "title" class="form-control border-secondary" id="title" name="title"/>
                                        <small class="text-danger" id="errTitle"></small>
                                    </div>
                                </div>
                                <div class="row border py-2">
                                    <div class="form-group">
                                        <label for="content">Nội dung</label>
                                        <span class="text-danger">*</span>
                                        <textarea type="text" name = "content" class="form-control border-secondary" id="content" name="content" rows="10"></textarea>
                                        <small class="text-danger" id="errContent"></small>
                                    </div>
                                </div>
                                <div class="row py-2">
                                    <div class="col py-4 form-group">
                                        <button type="submit" class="w-100 btn btn-info btn-lg text-white" type="submit">Gửi thư</button>
                                    </div>
                                </div>
                            </form>
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
	<script type="text/javascript">
    		function FormValidate() {
    			var title = document.getElementById('title').value;
    			var content = document.getElementById('content').value;

    			var errTitle = document.getElementById('errTitle');
    			var errContent = document.getElementById('errContent');

    			if (title == '' || title == null) {
    				errTitle.innerHTML = "Vui lòng không để trống";
    				return false;
    			} else {
    				errTitle.innerHTML = '';
    			}
    			if (content == '' || content == null) {
                    errContent.innerHTML = "Vui lòng không để trống";
                    return false;
                } else {
                    errContent.innerHTML = '';
                }
    			if (title && content) {
    				return true; //thực hiện việc submit form
    			}
    		}
    	</script>
</body>
</html>