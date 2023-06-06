<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    .text-container {
        max-height: 210px;
        overflow: hidden;
    }
</style>
<footer class="text-center text-lg-start bg-light text-muted">
		<section
			class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">

		</section>
		<section class="">
			<div class="container text-center text-md-start mt-5">
				<div class="row mt-3">
					<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4 text-container ">
						<h6 class="text-uppercase fw-bold mb-4">
							<i class="fas fa-gem me-3"></i>Giới thiệu
						</h6>
						<p>${contact.introduction }</p>
					</div>
					<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
						<h6 class="text-uppercase fw-bold mb-4">Products</h6>
						<c:forEach items="${listCate }" var="cate">
	                        <p>
	                            <a href="loadProductUser?cateId=${cate.cateId}" class="text-reset">${cate.cateName }</a>
	                        </p>
                        </c:forEach>
					</div>

					<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
						<h6 class="text-uppercase fw-bold mb-4">Useful links</h6>
						<p>
							<a href="home" class="text-reset">Trang chủ</a>
						</p>
						<p>
							<a href="policyUser" class="text-reset">Chính sách</a>
						</p>
						<p>
							<a href="getNews" class="text-reset">Tin tức</a>
						</p>
						<p>
							<a href="introductionUser" class="text-reset">Giới thiệu</a>
						</p>
					</div>

					<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
						<h6 class="text-uppercase fw-bold mb-4">Liên hệ</h6>
						<p>
							<i class="fas fa-home me-3"></i> ${contact.address }
						</p>
						<p>
							<i class="fas fa-envelope me-3"></i> ${contact.email }
						</p>
						<p>
							<i class="fas fa-phone me-3"></i> ${contact.phone }
						</p>
						<p>
							<i class="fas fa-print me-3"></i>${contact.phone }</p>
					</div>
				</div>
			</div>
		</section>

		<div class="text-center p-4"
			style="background-color: rgba(0, 0, 0, 0.05);">
			© 2023 Object: <a class="text-reset fw-bold" href="#">vesion v1.0</a>
		</div>
</footer>