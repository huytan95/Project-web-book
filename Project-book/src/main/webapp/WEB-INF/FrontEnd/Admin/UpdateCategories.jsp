<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <c:set value="/WEB-INF/FrontEnd/HeaderAdmin.jsp" var="headAdminURL" scope="application" />
    <jsp:include page="${headAdminURL}"></jsp:include>
    <title>Trang Categories</title>
</head>

<body>
                <div class="col-md-9">
                    <div class="row">
                        <h4>Sửa tên danh mục</h4>
                    </div>
                    <form:form class="row g-3" action="updateCategories" method="post" modelAttribute="categories" onsubmit="return FormValidate();">
                        <div class="col-md-8">
                          <label for="categoryName" class="form-label">ID</label>
                          <span class="text-danger">*</span>
                          <form:input path="cateId" type="text" class="form-control" id="cateId" readonly="true"/>
                          <small class="text-danger" id="errcateId"></small>
                        </div>
                        <div class="col-md-8">
                          <label for="categoryName" class="form-label">Tên danh mục</label>
                          <span class="text-danger">*</span>
                          <form:input path="cateName" type="text" class="form-control" id="cateName"/>
                          <small class="text-danger" id="errCateName"></small>
                        </div>
                        <div class="col-12">
                          <button type="submit" class="btn btn-primary">Lưu</button>
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