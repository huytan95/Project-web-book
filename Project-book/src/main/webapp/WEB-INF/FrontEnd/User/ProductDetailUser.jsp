<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="<c:url value="/sources/css/scroll.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/sources/css/Cart.css" />" rel="stylesheet" type="text/css" />
<title>Trang chi tiết sản phẩm</title>
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
                <!-- product detail -->
                <div class="row">
                    <div class="pd-wrap">
                        <div class="container">
                            <div class="heading-section p-3">
                                <h2 class = "text-center">Chi tiết sản phẩm</h2>
                            </div>
                            <!-- slider -->
                            <div class="row">
                                <div class="col-md-5 text-center">
                                    <img class= "img-fluid" style="max-width: 300px;" alt="${product.imageName}"  src="<c:url value ="/sources"/>/img/${product.imageName}">
                                </div>
                                <div class="col-md-7">
                                    <div class="product-dtl">
                                        <div class="product-info">
                                            <div class="product-name "><h5>${product.productName }</h5> </div>

                                            <div class="product-price-discount">
                                                <span class="fs-5 fw-bold text-danger" id="money">
                                                    <fmt:formatNumber value="${product.priceOutput * (100 - product.discound) div 100}" pattern="#,##0đ"/>

                                                </span>
                                                <c:if test="${product.discound !=0 }">
                                                    <span class="text-decoration-line-through">
                                                        <fmt:formatNumber value="${product.priceOutput}" pattern="#,##0đ"/>
                                                    </span>
                                                </c:if>

                                            </div>
                                        </div>
                                        <p> ${product.shortDescription}</p>

                                        <div class="product-count">
                                            <label for="size">Số lượng</label>
                                            <form action="#" class="display-flex">
                                                <div class="qtyminus">-</div>
                                                <input type="text" id="quantityInput" name="quantity" value="1" class="qty">
                                                <div class="qtyplus">+</div>
                                            </form>
                                            <a id="addToCartLink" href="#" class="btn text-white bg-info my-3">Thêm vào giỏ hàng</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- slider end -->
                            <!--  -->
                            <div class="row py-3">
                                <div class="product-info-tabs">
                                    <div class="row product-info-tabs">
                                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="description-tab" data-toggle="tab"
                                                    href="#description" role="tab" aria-controls="description"
                                                    aria-selected="true">Chi tiết sản phẩm</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="row">
                                        ${product.longDescription }
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- product detail end-->
                <!-- Comment-->
                <section style="background-color: #eee;">
                        <div class="container my-5 py-1">
                            <div class="row product-info-tabs">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="description-tab" data-toggle="tab"
                                            href="#description" role="tab" aria-controls="description"
                                            aria-selected="true">Bình luận</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="row d-flex">
                                <div class="col-md-12 col-lg-10 col-xl-8">
                                  <div>
                                      <c:forEach items="${commentList}" var="comment">
                                        <div class="card-body">
                                          <div class="d-flex flex-start align-items-center">
                                            <div>
                                              <h6 class="fw-bold text-primary mb-1">${comment.user.fullName}</h6>
                                              <p class="text-muted small mb-0">
                                                ${comment.commentDate}
                                              </p>
                                            </div>
                                          </div>
                                          <p class="mt-3 mb-4 pb-2">
                                            ${comment.commentContent}
                                          </p>
                                          <div class="small d-flex justify-content-start">
                                              <c:if test="${role eq 'Admin'}">
                                                  <a href="deleteCmt?commentId=${comment.commentId}" class="d-flex align-items-center me-3">
                                                    <p class="mb-0">Xóa</p>
                                                  </a>
                                              </c:if>
                                          </div>
                                        </div>
                                      </c:forEach>
                                    <form action="insertComment" method="post">
                                        <div class="card-footer py-3 border-0" style="background-color: #f8f9fa;">
                                          <div class="d-flex flex-start w-100">
                                              <div class="form-group">
                                                      <input type="hidden" name="productId" value="${product.productId}" />
                                              </div>
                                            <div class="form-outline w-100">
                                              <textarea maxlength = "255" name="commentContent" class="form-control" id="textAreaExample" rows="4"
                                                style="background: #fff;"></textarea>
                                              <label class="form-label" for="textAreaExample">Bình luận</label>
                                            </div>
                                          </div>
                                          <div class="float-end mt-2 pt-3">
                                            <button type="submit" class="btn btn-primary btn-sm">Gửi bình luận</button>
                                            <button type="reset" class="btn btn-outline-primary btn-sm">Xóa</button>
                                          </div>
                                    </form>
                                  </div>
                                </div>
                            </div>
                        </div>
                </section>
                <!-- Comment end-->
                <!-- Sản phẩm liên quan-->
                    <div class="container my-5 py-1">
                        <div class="row product-info-tabs">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="description-tab" data-toggle="tab"
                                       href="#description" role="tab" aria-controls="description"
                                       aria-selected="true">Sản phẩm liên quan</a>
                                </li>
                            </ul>
                        </div>
                        <div class="row py-3">
                            <c:set var="loopIndex" value="0" />
                            <c:forEach items="${productList }" var="relatedProducts" varStatus="loop">
                                <c:if test="${loopIndex <4}">
                                    <c:if test="${relatedProducts.productId != product.productId}">
                                        <c:set var="loopIndex" value="${loopIndex + 1}" />
                                        <div class="col-lg-3 col-md-6 mb-4">
                                            <div class="card">
                                                <div class="bg-image hover-zoom ripple"
                                                    data-mdb-ripple-color="light">
                                                    <img class= "img-fluid mx-4" style="width:230px;height:300px;" alt="${relatedProducts.imageName}"
                                                     src="<c:url value ="/sources"/>/img/${relatedProducts.imageName}"/>
                                                        <div class="mask">
                                                            <div class="d-flex justify-content-start align-items-end h-100">
                                                                <h5>
                                                                    <span class="badge bg-danger ms-2"><i class="fa-solid fa-arrow-down"></i>${relatedProducts.discound }%</span>
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
                                                    <a href="productDetailUser?productId=${relatedProducts.productId}" class="text-reset">
                                                        <h5 class="card-title mb-3 ellipsify">${relatedProducts.productName}</h5>
                                                    </a>

                                                    <h6 class="mb-3">
                                                        <div class = "row">
                                                            <div class="col">
                                                                <c:if test="${relatedProducts.discound!=0}">
                                                                    <s><fmt:formatNumber value="${relatedProducts.priceOutput }" pattern="#,##0đ"/></s>
                                                                </c:if>
                                                            </div>
                                                            <div class="col">
                                                                <strong class="ms-2 text-danger">
                                                                    <fmt:formatNumber value="${relatedProducts.priceOutput * (100 - relatedProducts.discound) div 100 }" pattern="#,##0đ"/>
                                                                </strong>
                                                            </div>
                                                        </div>
                                                    </h6>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                <!-- Sản phẩm liên quan end-->
            </div>
        </section>
    </body>
<footer>
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
    <!-- Truyền tham số quantity vào controller-->
        <script type="text/javascript">
            var quantity = parseInt($(".qty").val());
            var productStock = ${product.quantityProduct}; // Số sản phẩm tồn kho

            $("#addToCartLink").attr("href", "addToCart?productId=${product.productId}&quantity=" + quantity);

            $(".qtyminus").on("click", function() {
                if (quantity > 1) {
                    quantity--;
                    $(".qty").val(quantity);
                    $("#addToCartLink").attr("href", "addToCart?productId=${product.productId}&quantity=" + quantity);
                }
            });

            $(".qtyplus").on("click", function() {
                if (quantity < productStock) {
                    quantity++;
                    $(".qty").val(quantity);
                    $("#addToCartLink").attr("href", "addToCart?productId=${product.productId}&quantity=" + quantity);
                } else {
                    alert("Số lượng sản phẩm đã vượt quá số lượng tồn kho.");
                }
            });
        </script>
        <script type="text/javascript">
                document.querySelectorAll('.ellipsify').forEach(function (e) {
                if (e.offsetWidth < e.scrollWidth) {
                    e.setAttribute('title', e.textContent);
                } else{
                    e.removeAttribute('title');
                }
                });
        </script>
</html>