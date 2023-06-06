<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <c:set value="/WEB-INF/FrontEnd/HeaderAdmin.jsp" var="headAdminURL" scope="application" />
        <jsp:include page="${headAdminURL}"></jsp:include>
    <title>Trang thêm danh mục sản phẩm</title>
</head>

<body>

                <!-- categories-->
                <div class="col-md-9">
                    <div class="row">
                    	<h4 style="color:red">${err}</h4>
                        <h4>Thêm danh mục</h4>
                    </div>
                    <form:form class="row g-3" action="insertCategories" method="post" modelAttribute="categories" onsubmit="return FormValidate();">
                        <div class="col-md-8">
                          <label for="categoryName" class="form-label">Tên danh mục</label>
                          <span class="text-danger">*</span>
                          <form:input path="cateName" type="text" class="form-control" id="cateName"/>
                          <small class="text-danger" id="errCateName"></small>
                        </div>
                        <div class="col-12">
                          <button type="submit" class="btn btn-primary">Thêm</button>
                          <button type="reset" class="btn btn-primary">Xóa</button>
                        </div>
                      </form:form>
                </div>
                <!--categories end-->
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
    <!-- validate form -->
<script>
    function FormValidate(){
        var categoryName = document.getElementById('cateName').value;
        var errCategoryName = document.getElementById('errCateName');

        if(categoryName==''|| categoryName== null){
            errCategoryName.innerHTML='Vui lòng không để trống'
            return false;
        } else {
            errCategoryName='';
        }
    }
</script>

    <!-- validate form end-->
</body>

</html>