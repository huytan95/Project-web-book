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
				<h3 style="color:red">${err}</h3>
					<form:form action="insertNews" method="post" runat="server" enctype="multipart/form-data" onsubmit="return FormValidate();" modelAttribute="news">
                        <div class="row">
                            <div class="col-md-7">
                                <div class="row text-center">
                                    <h3>Thêm tin tức</h3>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <label for="productName">Tiêu đề</label>
                                        <span class="text-danger">*</span>
                                        <form:input type="text" path="newsTitle" class="form-control border-secondary" id="newsTitle" name="newsTitle"
                                            placeholder="Tiêu đề" />
                                        <small class="text-danger" id="errNewsTitle"></small>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <label for="newsDescription">Mô tả ngắn</label>
                                        <span class="text-danger">*</span>
                                        <form:textarea maxlength = "100" type="text" path="newsDescription" class="form-control border-secondary" id="newsDescription" name="newsDescription"
                                            placeholder="Mô tả ngắn" rows="3"/>
                                        <small class="text-danger" id="errNewsDescription"></small>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <label for="newsContent">Nội dung</label>
                                        <span class="text-danger">*</span>
                                        <form:textarea  maxlength = "4000" type="text" path="newsContent" class="form-control border-secondary" id="newsContent" name="newsContent"
                                            placeholder="Nội dung" rows="7"/>
                                        <small class="text-danger" id="errNewsContent"></small>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <label for="productName">Nội dung</label>
                                            <%
										       	java.util.Date now = new java.util.Date();
										        java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("dd/MM/yyyy");
										        String importDate = dateFormat.format(now);
										    %>
                                            <form:input path="newsDate" type="text" value="<%= importDate %>" readonly="true" class="form-control border-dark rounded" id="newsDate"/>
                                            <small class="text-danger" id="errNewsDate"></small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5 text-center">
                                <h3>Thêm hình ảnh sản phẩm</h3>
                                <div class="row">
                                	<div class="button-wrap">
                                	<label class="button" for="upload">Chọn 1 ảnh</label>
										<input required="required" id="upload" class = "mx-3" name = "newsImageName" type="file" accept="image/*" onchange="loadFile(event)">
										<img id="output" class="img-fluid" style="max-width: 250px;"/>
									</div>
                                </div>
                                <div class="row">
                                    <div class="form-group py-3 text-end">
                                        <button type="submit" class="btn btn-primary mb-2">Thêm tin tức</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form:form>
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
	 <script type="text/javascript" src="<c:url value="/sources/js/insertProduct.js" />"> </script>
	<script>
  		var loadFile = function(event) {
    	var output = document.getElementById('output');
    	output.src = URL.createObjectURL(event.target.files[0]);
    	output.onload = function() {
      	URL.revokeObjectURL(output.src) // free memory
    }
  };
  </script>
  <script>
	function maxLength(el) {	
		if (!('maxLength' in el)) {
			var max = el.attributes.maxLength.value;
			el.onkeypress = function () {
				if (this.value.length >= max) return false;
			};
		}
	}

	maxLength(document.getElementById("longDescription"));
</script>
    <script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
    <script>
           CKEDITOR.replace( 'newsContent' );
           CKEDITOR.replace( 'newsDescription' );
    </script>
</body>
</html>