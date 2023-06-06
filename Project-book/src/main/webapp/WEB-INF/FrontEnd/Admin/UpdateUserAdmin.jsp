<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<c:set value="/WEB-INF/FrontEnd/HeaderAdmin.jsp" var="headAdminURL" scope="application" />
    <jsp:include page="${headAdminURL}"></jsp:include>
<head>

<title>Trang thêm sản phẩm mới</title>
</head>

<body>
				<div class="col-md-9">
                        <div class="row">
                        <div class="col-md-8">
                        	<div class="row text-center">
                                <h3>Sửa thông tin tài khoản</h3>
                            </div>
                            <form:form action="admin-updateUser" method="post" modelAttribute="user" onsubmit="return FormValidate();">
                            	<div class="row">
                                    <div class="form-group pt-2">
                                        <label for="userName">Tên đăng nhập</label>
                                        <span class="text-danger">*</span>
                                        <form:input type="text" path="userName" class="form-control border-secondary" id="userName" name="userName"/>
                                        <form:input type="hidden" path="id" class="form-control border-secondary" id="id" name="id"/>
                                        <form:input type="hidden" path="password" class="form-control border-secondary" id="password" name="password"/>
                                        <small class="text-danger" id="errUserName"></small>
                                    </div>
                                    <div class="form-group pt-3">
                                        <label for="fullName">Họ và tên</label>
                                        <span class="text-danger">*</span>
                                        <form:input type="text" path="fullName" class="form-control border-secondary" id="fullName" name="fullName"/>
                                        <small class="text-danger" id="errFullName"></small>
                                    </div>
                                     <div class="form-group pt-3">
                                        <label for="gender">Giới tính</label>
                                        <span class="text-danger">*</span>
                                        <br>
                                        <form:radiobutton path="gender" id="gender" name="gender" value="true"/> Nam
                                        <form:radiobutton path="gender"  id="gender" name="gender" value="false"/> Nữ
                                        <small class="text-danger" id="errGender"></small>
                                    </div>
                                    <div class="form-group pt-3">
                                        <label for="birthday">Ngày tháng năm sinh</label>
                                        <span class="text-danger">*</span>
                                        <form:input path="birthday" class="form-control border-secondary" id="birthday" name="birthday"/>
                                        <small class="text-danger" id="errBirthday"></small>
                                    </div>
                                    <div class="form-group pt-3">
                                        <label for="address">Địa chỉ</label>
                                        <span class="text-danger">*</span>
                                        <form:input path="address" class="form-control border-secondary" id="address" name="address"/>
                                        <small class="text-danger" id="errAddress"></small>
                                    </div>
                                    <div class="form-group pt-3">
                                        <label for="email">Email</label>
                                        <span class="text-danger">*</span>
                                        <form:input path="email" class="form-control border-secondary" id="email" name="email"/>
                                        <small class="text-danger" id="errEmail"></small>
                                    </div>
                                    <div class="form-group pt-3">
                                        <label for="phoneNumber">Số điện thoại</label>
                                        <span class="text-danger">*</span>
                                        <form:input path="phoneNumber" class="form-control border-secondary" id="phoneNumber" name="phoneNumber"/>
                                        <small class="text-danger" id="errPhoneNumber"></small>
                                    </div>
                                    <div class="form-group pt-3">
                                        <label for="enabled">Trạng thái</label>
                                        <span class="text-danger">*</span>
                                        <br>
                                        <form:radiobutton path="enabled" id="gender" name="gender" value="1"/> Hoạt động
                                        <form:radiobutton path="enabled"  id="gender" name="gender" value="0"/> Ngưng hoạt động
                                        <small class="text-danger" id="errPhoneNumber"></small>
                                    </div>
                                     <div class="form-group pt-3">
                                        <label for="phoneNumber">Vai trò trên trang</label>
                                        <span class="text-danger">*</span>
                                        <form:select path="userRoles.role" class="form-select" aria-label="Default select example">
									        <form:options items="${listRole}" itemValue="id" itemLabel="name" />
									    </form:select>
									    <small class="text-danger" id="errUserRoles"></small>
                                    </div>
                                    <div class="row py-3">
										<div class="col-md-9"></div>
										<div class="col-md-3">
											<button type="submit" class="btn btn-primary mb-2">Lưu thông tin</button>
										</div>
                                	</div>
                                </div>
							    </form:form>
							</div> 
                        </div>
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
	<script type="text/javascript">
	function FormValidate() {
		var productName = document.getElementById('productName').value;
	    var categories = document.getElementById('categories').value;
	    var priceInput = document.getElementById('priceInput').value;
	    var priceOutput = document.getElementById('priceOutput').value;
	    var shortDescription = document.getElementById('shortDescription').value;
	    var longDescription = document.getElementById('longDescription').value;
	    var discound = document.getElementById('discound').value;
	    var quantity = document.getElementById('quantity').value;

	    var errProductName = document.getElementById('errProductName');
	    var errCategories = document.getElementById('errCategories');
	    var errPriceInput = document.getElementById('errPriceInput');
	    var errPriceOutput = document.getElementById('errPriceOutput');
	    var errShortDescription = document.getElementById('errShortDescription');
	    var errLongDescription = document.getElementById('errLongDescription');
	    var errDiscound = document.getElementById('errDiscound');
	    var errQuantity = document.getElementById('errQuantity');

	    const regexProductName = /^(?!.*  )[^\n]+$/;

	    //check product name
	    if (productName == '' || productName == null) {
			errProductName.innerHTML = "Vui lòng không để trống";
	        return false;
		} else if (!regexProductName.test(productName)) {
			errProductName.innerHTML = "Tên không hợp lệ";
			return false;
		} else {
			errProductName.innerHTML = '';
		}
	    // check categories 
	    if (categories == '' || categories == null) {
			errCategories.innerHTML = "Vui lòng chọn danh mục sản phẩm";
	        return false;
	    }else {
			errCategories.innerHTML = '';
		}
	    //check originalPrice
	    if (priceInput == '' || priceInput == null) {
	    	errPriceInput.innerHTML = "Vui lòng không để trống";
	        return false;
	    }else if(priceInput<=0){
	    	errPriceInput.innerHTML = "Giá bán phải lớn hơn 0 đồng!";
	        return false;
	    }{
	    	errPriceInput.innerHTML = '';
		}
	    // check salePrice
	    if (priceOutput == '' || priceOutput == null) {
	    	errPriceOutput.innerHTML = "Vui lòng không để trống";
	        return false;
	    }else if(priceOutput <= 0){
	    	errPriceOutput.innerHTML = "Giá bán phải lớn hơn 0 đồng!";
	        return false;
	    }{
	    	errPriceOutput.innerHTML = '';
		}
	 // check discound
	    if (discound < 0) {
	    	errDiscound.innerHTML = "Giá trị phải lớn hơn 0 đồng!";
	        return false;
	    }else {
	    	errDiscound.innerHTML = '';
		}
	 // check quantity
	    if (quantity == '' || quantity == null) {
	    	errQuantity.innerHTML = "Vui lòng không để trống";
	        return false;
	    }else if(quantity<=0){
	    	errQuantity.innerHTML = "Giá bán phải lớn hơn 0 đồng!";
	        return false;
	    }{
	    	errQuantity.innerHTML = '';
		}
	    //check short Description
	    if (shortDescription == '' || shortDescription == null) {
			errShortDescription.innerHTML = "Vui lòng không để trống";
	        return false;
	    }else {
			errShortDescription.innerHTML = '';
		}
	    //check long Desscription
	    if (longDescription == '' || longDescription == null) {
			errLongDescription.innerHTML = "Vui lòng không để trống";
	        return false;
	    }else {
			errLongDescription.innerHTML = '';
		}
	    //everything ok
	    if (productName && categories && priceInput && priceOutput && discound && shortDescription && longDescription) {
	        // Người dùng đã nhập đúng thông tin
	        alert("Thêm sản phẩm thành công");
	        return true; //thực hiện việc submit form
	    }
	}
	</script>
	<script>
  		var loadFile = function(event) {
    	var output = document.getElementById('output');
    	output.src = URL.createObjectURL(event.target.files[0]);
    	output.onload = function() {
      	URL.revokeObjectURL(output.src) // free memory
    }
  };
  </script>
	
</body>
</html>