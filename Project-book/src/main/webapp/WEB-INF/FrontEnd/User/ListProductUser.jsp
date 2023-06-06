<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

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
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<link href="<c:url value="/sources/css/scroll.css" />" rel="stylesheet" type="text/css" />
<style type="text/css">
	.ellipsify {
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    max-width: 180px;
    display: inline-block;  
}
</style>
<title>Trang sản phẩm</title>
<c:set value="/WEB-INF/FrontEnd/Header.jsp" var="headURL" scope="application" />
<jsp:include page="${headURL}"></jsp:include>

</head>

<body>

	<!-- main menu -->

	<!-- product -->
	<section class="product-list">
		<div class="container">
			<div class="row d-inline mx-1 ">
				<a href="home" class="text-decoration-none text-reset p-0">Trang chủ</a>
				<a href="#" class="text-decoration-none text-reset p-0">/${categories.cateName}</a>
			</div>
			<div class="row py-4">
				<!-- menu dọc -->
				<div class="col-md-3">
					<div class="list-group">
						<a href="#" class="list-group-item list-group-item-action text-white bg-info">
							DANH MỤC SẢN PHẨM</a> 
						<c:forEach items="${listCate }" var="cate">
							<a class="list-group-item list-group-item-action" href="loadProductUser?cateId=${cate.cateId}">${cate.cateName }</a>
						</c:forEach>
					</div>
				</div>
				<!-- menu dọc end -->
				<div class="col">
					<div class="row">
						<div class="row">
					<img src="<c:url value="/sources"/>/img/${imageBanner.imageName}" alt="${imageBanner.imageName}">
				</div>
					</div>
					<div class="row py-4 bg-info my-4 text-center text-white rounded">
						<strong>${categories.cateName }</strong>
					</div>
					<div class="row">
						<div class="row py-3">
						<c:forEach items = "${ListProductByCateId }" var="productByCateId">
							<div class="col-lg-3 col-md-6 mb-4">
								<div class="card">
									<div class="bg-image ripple"
										data-mdb-ripple-color="light">
										<img class= "img-fluid " style="width:220px;height:300px;"
											src="<c:url value="/sources"/>/img/${productByCateId.imageName}" alt="${productByCateId.imageName}"/>
											<div class="mask">
												<div
													class="d-flex justify-content-start align-items-end h-100">
													<h5>
														<span class="badge bg-danger ms-2 discount">
															<i class="fa-solid fa-arrow-down"></i> ${productByCateId.discound}%</span>
													</h5>
												</div>
											</div>
											<div class="hover-overlay">
												<div class="mask"
													style="background-color: rgba(251, 251, 251, 0.15);">
												</div>
											</div>
										</a>
									</div>
									<div class="card-body">
										<a href="productDetailUser?productId=${productByCateId.productId}" class="text-reset">
										<div class="card-title mb-3" >
											<strong class = "ellipsify">${productByCateId.productName}</strong>	
										</div>
										</a>
										<div class = "row">
											<div class="col">
												<c:if test="${productByCateId.discound!=0}">
													<s class="original-price">
													    <fmt:formatNumber value="${productByCateId.priceOutput}" pattern="#,##0đ"/>
													</s>
												</c:if></div>
											<div class="col">
												<h6 class="mb-3">
											      <strong class="ms-2 text-danger">
											            <fmt:formatNumber value="${productByCateId.priceOutput * (100 - productByCateId.discound) div 100}"
											                pattern="#,##0đ"/>
											      </strong>
											    </h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						</div>
					</div>
					<div class="row">
						<nav aria-label="...">
					        <ul class="pagination justify-content-center">
					            <li class="page-item">
					                <a class="page-link" href="loadProductUser?cateId=${categories.cateId}&page=${previous}">Previous</a>
					            </li>
					            <c:forEach items="${listPage}" var="page">

					                <li class="page-item pageLink">
					                    <a class="page-link" href="loadProductUser?cateId=${categories.cateId}&page=${page}">${page}</a>
					                </li>
					            </c:forEach>
					             <li class="page-item ">
                                	 <a class="page-link" href="loadProductUser?cateId=${categories.cateId}&page=${next}">Next</a>
                                 </li>
					        </ul>
					   </nav>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- product end -->

	<!-- Footer -->
        <c:set value="/WEB-INF/FrontEnd/Footer.jsp" var="footerURL" scope="application" />
        <jsp:include page="${footerURL}"></jsp:include>
    <!-- Footer end-->

	<!-- Back to top -->
        <a href="#" class="cd-top"><i class="fa-solid fa-arrow-up-from-bracket"></i></a>
    <!-- Back to top end -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
	<script type="text/javascript" src="<c:url value="/sources/js/scroll.js" />"> </script>
	<script type="text/javascript">
		document.querySelectorAll('.ellipsify').forEach(function (e) {
        if (e.offsetWidth < e.scrollWidth) {
            e.setAttribute('title', e.textContent);
        } else{
            e.removeAttribute('title');
        }
    	});
</script>
</body>

</html>