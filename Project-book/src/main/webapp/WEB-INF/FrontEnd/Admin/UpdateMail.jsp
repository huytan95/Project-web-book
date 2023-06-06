<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>Trang Mail</title>
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
                <!-- dashboard end -->
                <div class="col-md-9">
                    <div class="row col-md-8">
                        <h3 class="text-center ">Sửa nội dung mail tự động</h3>
                        <h4 class="text-danger ">${err}</h4>
                    </div>
                    <form:form class="row g-3" action="admin-updateMail" method="post" modelAttribute="mailAuto" onsubmit="return FormValidate();">
                        <div class="col-md-8">
                          <label for="mailId" class="form-label">ID</label>
                          <span class="text-danger">*</span>
                          <form:input path="mailId" type="text" class="form-control" id="mailId" readonly="true"/>
                          <small class="text-danger" id="errMailId"></small>
                        </div>
                        <div class="col-md-8">
                          <label for="mailType" class="form-label">Thể loại</label>
                            <c:choose>
                              <c:when test="${mailAuto.mailId == 1}">
                                <span class="text-danger">(* Dùng để trả lời tự động khi khách hàng đăng ký tư vấn)</span>
                              </c:when>
                              <c:when test="${mailAuto.mailId == 2}">
                                <span class="text-danger">(* Dùng để trả lời tự động khi khách hàng mua hàng)</span>
                              </c:when>
                            </c:choose>
                          <form:input path="mailType" type="text" class="form-control" id="mailType" readonly="true"/>
                          <small class="text-danger" id="errMailType"></small>
                        </div>
                        <div class="col-md-8">
                          <label for="mailContent" class="form-label">Nội dung</label>
                         <span class="text-danger">*</span>
                          <form:textarea path="mailContent" type="text" class="form-control" id="mailContent" maxlength="2000" rows="7"/>
                          <small class="text-danger" id="errMailContent"></small>
                        </div>
                        <div class="col-12">
                          <button type="submit" class="btn btn-primary">Lưu</button>
                          <button type="reset" class="btn btn-primary">Xóa</button>
                        </div>
                      </form:form>
                </div>
            </div>
        </div>
    </section>
    <!-- body end -->

    <!-- footter -->
    <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
        © 2023 Object:
        <a class="text-reset fw-bold" href="#">vesion v1.0</a>
    </div>
    <!-- footter end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
   	</script>
   	<script type="text/javascript" src="<c:url value="/sources/js/UpdateMail.js" />"> </script>
   	<script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
    <script>
         CKEDITOR.replace( 'mailContent' );
    </script>
</body>

</html>