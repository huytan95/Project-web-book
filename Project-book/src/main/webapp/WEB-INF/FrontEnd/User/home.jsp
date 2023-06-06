<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
<c:set value="/WEB-INF/FrontEnd/Header.jsp" var="headURL" scope="application" />
<jsp:include page="${headURL}"></jsp:include>
<style type="text/css">
	.ellipsify {
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    max-width: 220px;
    display: inline-block;
}
</style>
</head>
<body>
<section class="bodycontent">
		<div class="container">
			<!-- banner -->
				<div class="row">
					<img src="<c:url value="/sources"/>/img/${imageBanner.imageName}" alt="${imageBanner.imageName}">
				</div>

			<!-- banner end -->

			<!-- product -->
			<div class="row py-3">
				<a href="#"
					class="list-group-item list-group-item-action list-group-item-light bg-info text-white"
					style="text-align: center;"><strong>SẢN PHẨM ĐANG GIẢM GIÁ</strong> </a>
			</div>
			<div class="row py-3">
				<c:forEach items="${listTopDiscountProduct }" var="productDiscount">
					<div class="col-lg-3 col-md-6 mb-4">
						<div class="card">
							<div class="bg-image hover-zoom ripple"
								data-mdb-ripple-color="light">
								<img class= "img-fluid mx-4" style="width:230px;height:300px;" alt="${productDiscount.imageName}"
							     src="<c:url value ="/sources"/>/img/${productDiscount.imageName}"/>
									<div class="mask">
										<div class="d-flex justify-content-start align-items-end h-100">
											<h5>
												<span class="badge bg-danger ms-2"><i class="fa-solid fa-arrow-down"></i>${productDiscount.discound }%</span>
											</h5>
										</div>
									</div>
									<div class="hover-overlay">
										<div class="mask"
											style="background-color: rgba(251, 251, 251, 0.15);"></div>
									</div>
								</a>
							</div>
							<div class="card-body">
								<a href="productDetailUser?productId=${productDiscount.productId}" class="text-reset">
									<h5 class="card-title mb-3 ellipsify">${productDiscount.productName }</h5>
								</a>

								<h6 class="mb-3">
                                    <div class = "row">
                                        <div class="col">
                                            <c:if test="${productDiscount.discound!=0}">
                                                <s><fmt:formatNumber value="${productDiscount.priceOutput }" pattern="#,##0đ"/></s>
                                            </c:if>
                                        </div>
                                        <div class="col">
                                            <strong class="ms-2 text-danger">
                                                <fmt:formatNumber value="${productDiscount.priceOutput * (100 - productDiscount.discound) div 100 }" pattern="#,##0đ"/>
                                            </strong>
                                        </div>
                                    </div>
								</h6>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="row">
				<a href="#"
					class="list-group-item list-group-item-action list-group-item-light bg-info text-white"
					style="text-align: center;"><strong>SẢN PHẨM BÁN CHẠY</strong>
				</a>
			</div>
			<div class="row py-3">
                <c:forEach items="${listTopSale }" var="topProduct">
					<div class="col-lg-3 col-md-6 mb-4">
						<div class="card">
							<div class="bg-image hover-zoom ripple"
								data-mdb-ripple-color="light">
								<img class= "img-fluid mx-4" style="width:230px;height:300px;" alt="${topProduct.product.imageName}"
							     src="<c:url value ="/sources"/>/img/${topProduct.product.imageName}"/>
									<div class="mask">
										<div class="d-flex justify-content-start align-items-end h-100">
											<h5>
												<span class="badge bg-danger ms-2"><i class="fa-solid fa-arrow-down"></i>${topProduct.product.discound }%</span>
											</h5>
                                            <h5>
												<span class="badge bg-warning ms-2">Đã bán ${topProduct.quantity }</span>
											</h5>
										</div>
									</div>
									<div class="hover-overlay">
										<div class="mask"
											style="background-color: rgba(251, 251, 251, 0.15);"></div>
									</div>
								</a>
							</div>
							<div class="card-body">
								<a href="productDetailUser?productId=${topProduct.product.productId}" class="text-reset">
									<h5 class="card-title mb-3 ellipsify">${topProduct.product.productName}</h5>
								</a>

								<h6 class="mb-3">
                                    <div class = "row">
                                        <div class="col">
                                            <c:if test="${topProduct.product.discound!=0}">
                                                <s><fmt:formatNumber value="${topProduct.product.priceOutput }" pattern="#,##0đ"/></s>
                                            </c:if>
                                        </div>
                                        <div class="col">
                                            <strong class="ms-2 text-danger">
                                                <fmt:formatNumber value="${topProduct.product.priceOutput * (100 - topProduct.product.discound) div 100 }" pattern="#,##0đ"/>
                                            </strong>
                                        </div>
                                    </div>
								</h6>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="row">
				<a href="#"
					class="list-group-item list-group-item-action list-group-item-light bg-info text-white"
					style="text-align: center;"><strong>SẢN PHẨM MỚI</strong> </a>
			</div>
			<div class="row py-3">
			<c:forEach items="${listTopNewProduct }" var="newProduct">
				<div class="col-lg-3 col-md-12 mb-4">
					<div class="card">
						<div class="bg-image ripple"
							data-mdb-ripple-color="light">
							<img class= "img-fluid mx-4" style="width:230px;height:300px;" alt="${newProduct.imageName}"
							     src="<c:url value ="/sources"/>/img/${newProduct.imageName}"/>
							<div class="mask">
								<div class="d-flex justify-content-start align-items-end h-100">
                                    <h5>
										<span class="badge bg-danger ms-2"><i class="fa-solid fa-arrow-down"></i>${newProduct.discound }%</span>
									</h5>
									<h5>
										<span class="badge bg-primary ms-2">New</span>
									</h5>
								</div>
							</div>
						</div>
						<div class="card-body">
							<a href="productDetailUser?productId=${newProduct.productId}" class="text-reset">
								<h5 class="card-title mb-3 ellipsify">${newProduct.productName }</h5>
							</a>
							<h6 class="mb-3">
                                <div class = "row">
                                    <div class="col">
                                        <c:if test="${newProduct.discound!=0}">
                                            <s><fmt:formatNumber value="${newProduct.priceOutput }" pattern="#,##0đ"/></s>
                                        </c:if>
                                    </div>
                                    <div class="col">
                                        <strong class="ms-2 text-danger">
                                            <fmt:formatNumber value="${newProduct.priceOutput * (100 - newProduct.discound) div 100 }" pattern="#,##0đ"/>
                                        </strong>
                                    </div>
                                </div>
							</h6>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</body>

<!-- Footer -->
    <c:set value="/WEB-INF/FrontEnd/Footer.jsp" var="footerURL" scope="application" />
    <jsp:include page="${footerURL}"></jsp:include>
<!-- Footer end-->
	<a href="#" class="cd-top"><i
		class="fa-solid fa-arrow-up-from-bracket"></i></a>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>

	<!-- back to top -->
	<script type="text/javascript" src="<c:url value="/sources/js/scroll.js" />"> </script>
    <!-- back to top end-->

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