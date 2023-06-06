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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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
<title>Trang sản phẩm</title>
</head>

<body>
				<div class="col-md-9">
                        <div class="row">
                        <div class="col-md-8">
                        	<div class="row text-center">
                                <h3>Thông tin chi tiết sản phẩm</h3>
                            </div>
                            <div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Mã sản phẩm</div>
                    			<div class="col-md-9 m-auto p-auto">${product.productId }</div>
							</div>
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Tên sản phẩm</div>
		                    	<div class="col-md-9 m-auto p-auto ">${product.productName }</div>
							</div>
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Danh mục sản phẩm</div>
		                    	<div class="col-md-9 m-auto p-auto">${product.categories.cateName }</div>
							</div>    
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Giá nhập</div>
		                    	<div class="col-md-9 m-auto p-auto">${product.priceInput}đ</div>
							</div> 
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Giá bán</div>
		                    	<div class="col-md-9 m-auto p-auto">${product.priceOutput}đ</div>
							</div> 
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Tồn kho</div>
		                    	<div class="col-md-9 m-auto p-auto">${product.quantityProduct}</div>
							</div> 
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Giảm giá</div>
		                    	<div class="col-md-9 m-auto p-auto">${product.discound}%</div>
							</div> 
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Ngày nhập</div>
		                    	<div class="col-md-9 m-auto p-auto">${product.importDate}</div>
							</div> 
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Mô tả ngắn</div>
		                    	<div class="col-md-9 m-auto p-auto">
		                    		<textarea name="" id="" cols="60" rows="5">${product.shortDescription}</textarea>
		                    	</div>
							</div> 
							<div class="row border py-2">
								<div class="col-md-3 border-end m-auto p-auto">Mô tả chi tiết</div>
		                    	<div class="col-md-9 m-auto p-auto">
		                    		<textarea name="" id="" cols="60" rows="10">${product.longDescription}</textarea>
		                    	</div>
							</div> 
                        </div>
                        <div class="col-md-4">
                        	<div class="row text-center">
                                <h3 class="">Hình ảnh</h3>
                            </div>
                            <div class="row px-4">
                                <img class= "img-fluid" style="max-width: 250px;" alt="${product.imageName}"  src="<c:url value ="sources"/>/img/${product.imageName}">
                            </div>
                            <div class="row">
                            	<div class="form-group py-3 text-end">
                                    <a href="admin-preUpdateProduct?productId=${product.productId }" class="btn btn-primary">Sửa sản phẩm</a>
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