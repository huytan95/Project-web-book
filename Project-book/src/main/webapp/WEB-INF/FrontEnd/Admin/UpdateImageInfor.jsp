<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
      }
    </style>
<title>Trang Dashboard</title>
</head>

<body>
				<div class="col-md-9">
						<div class="row">
							<h2 class="text-center">Chỉnh sửa thông tin trang web</h2>
						</div>
						<h3 style="color: red">${err }</h3>
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-md-8">
								<form:form action="admin-updateImageInfor" runat="server" enctype="multipart/form-data" method="post" modelAttribute="imageInfor">
									<form:input path="id" type = "hidden" class="form-control" readonly="true"/> 
									<form:input path="imageType" type = "hidden" class="form-control" readonly="true"/> 
									<div class="button-wrap">
										<label class="button" for="upload">Tải ảnh lên</label>
										<input id="upload" name = "imageInforName" type="file" accept="image/*" onchange="loadFile(event)">
										<img id="output"/>
									</div>
									<div class="form-group py-3 text-end">
										<button type="submit" value="update"
											class="btn btn-primary mb-2">Lưu thông tin</button>
									</div>
								</form:form>
							</div>
							<div class="col-md-2"></div>
						</div>
				</div>
				<!-- edit contact end-->

			</div>
		</div>
	</section>
	<!-- body end -->

	<!-- footter -->
	<div class="text-center p-4"
		style="background-color: rgba(0, 0, 0, 0.05);">
		© 2023 Object: <a class="text-reset fw-bold" href="#">vesion v1.0</a>
	</div>
	<!-- footter end -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
		
	</script>
	<!-- validate form -->
	<script>
  		var loadFile = function(event) {
    	var output = document.getElementById('output');
    	output.src = URL.createObjectURL(event.target.files[0]);
    	output.onload = function() {
      	URL.revokeObjectURL(output.src) // free memory
    }
  };
</script>
	

	<!-- validate form end-->
</body>

</html>