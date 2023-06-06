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
<style>
      input[type="file"] {
        position: absolute;
        z-index: -1;
        top: 10px;
        left: 8px;
        font-size: 17px;
        color: #b8b8b8;
      }
      .button-wrap {
        position: relative;
      }
      .button {
        display: inline-block;
        padding: 12px 18px;
        cursor: pointer;
        border-radius: 5px;
        background-color: #8ebf42;
        font-size: 16px;
        font-weight: bold;
        color: #fff;
        float: left;
      }
</style>
<title>Trang thêm sản phẩm mới</title>
</head>

<body>
				<div class="col-md-9">
                        <div class="row">
                        <div class="col-md-8">
                        	<div class="row text-center">
                                <h3>Chi tiết bài đăng</h3>
                            </div>

							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Tiêu đề</div>
		                    	<div class="col-md-9 m-auto p-auto ">${news.newsTitle }</div>
							</div>
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Mô tả ngắn</div>
		                    	<div class="col-md-9 m-auto p-auto">${news.newsDescription }</div>
							</div>    
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Nội dung</div>
		                    	<div class="col-md-9 m-auto p-auto">${news.newsContent}</div>
							</div> 
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Ngày đăng</div>
		                    	<div class="col-md-9 m-auto p-auto">${news.newsDate}đ</div>
							</div> 
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Lượt xem</div>
		                    	<div class="col-md-9 m-auto p-auto">${news.newsViews}</div>
							</div>
                        </div>
                        <div class="col-md-4">
                        	<div class="row text-center">
                                <h3 class="">Hình ảnh</h3>
                            </div>
                            <div class="row px-4">
                                <img class= "img-fluid" style="max-width: 250px;" alt="${news.newsImage}"  src="<c:url value ="sources"/>/img/${news.newsImage}">
                            </div>
                            <div class="row">
                            	<div class="form-group py-3 text-end">
                                    <a href="preUpdateNews?newsId=${news.newsId }" class="btn btn-primary">Sửa bài viết</a>
                                </div>
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