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

<title>Thông tin tài khoản</title>
</head>

<body>


				<div class="col-md-9">
                   <div class="row">
                        <div class="col-md-8">
                        	<div class="row text-center">
                                <h3>Thông tin tài khoản</h3>
                            </div>
                            <div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Tên đăng nhập</div>
                    			<div class="col-md-9 m-auto p-auto">${user.userName }</div>
							</div>
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Họ và tên</div>
		                    	<div class="col-md-9 m-auto p-auto ">${user.fullName }</div>
							</div>
							   
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Giới tính</div>
		                    	<div class="col-md-9 m-auto p-auto">${user.gender ? "Nam" : "Nữ"}</div>
							</div> 
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Ngày tháng năm sinh</div>
		                    	<div class="col-md-9 m-auto p-auto">${user.birthday}</div>
							</div> 
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Địa chỉ</div>
		                    	<div class="col-md-9 m-auto p-auto">${user.address}</div>
							</div> 
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Email</div>
		                    	<div class="col-md-9 m-auto p-auto">${user.email}</div>
							</div> 
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Số điện thoại</div>
		                    	<div class="col-md-9 m-auto p-auto">${user.phoneNumber}</div>
							</div> 
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Trạng thái</div>
		                    	<div class="col-md-9 m-auto p-auto"
		                    		style="color: ${user.enabled == 1 ? "green" : "red"};">
		                    		${user.enabled == 1 ? "Hoạt động" : "Tạm ngưng" }</div>
							</div> 
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Vai trò trên trang</div>
		                    	<div class="col-md-9 m-auto p-auto">
									<c:forEach items="${user.userRoles}" var="userRole">
    									<c:out value="${userRole.role.name == 'ROLE_USER' ? 'user' : 'admin'}"/><br>
									</c:forEach>
								</div>
							</div> 
							<div class="row py-2">
								<div class="col-md-9"></div>
								<div class="col-md-3">
									<a class="btn btn-primary" href="admin-preUpdateUser?id=${user.id}" role="button">Sửa thông tin</a>
								</div>
							</div>
                        </div>
					</div>
				</div>
				<!-- thông tin web end-->
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
	<script type="text/javascript" src="<c:url value="/sources/js/detailUser.js"/>"></script>
	<script>
  		var loadFile = function(event) {
    	var output = document.getElementById('output');
    	output.src = URL.createObjectURL(event.target.files[0]);
    	output.onload = function() {
      	URL.revokeObjectURL(output.src) // free memory
    }
  };
  </script>
  <script type="text/javascript">
  $('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})
  </script>
	
</body>
</html>