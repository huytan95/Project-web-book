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
    max-width: 280px;
    display: inline-block;
}
</style>
</head>
<body>
<section class="product-list">
        <div class="container">
            <div class="row d-inline mx-1 ">
                <a href="home" class="text-decoration-none text-reset p-0">Trang chủ</a>
                <a href="#" class="text-decoration-none text-reset p-0">/Tin tức</a>
            </div>
            <div class="row py-4">
                <!-- menu dọc -->
                <div class="col-md-4">
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
                          <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">Tin nổi bật</h5>
                          </div>
                        </a>
                        <c:forEach items="${listTop3News}" var="topNews">
                            <a href="newsDetail?newsId=${topNews.newsId}" class="list-group-item list-group-item-action">
                              <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1 ellipsify">${topNews.newsTitle}</h5>
                                <small class="text-body-secondary">
                                    <fmt:formatDate value="${topNews.newsDate}" pattern="yyyy-MM-dd" />
                                </small>
                              </div>
                              <p class="mb-1 ">${topNews.newsDescription}</p>
                              <small class="text-body-secondary">Xem thêm...</small>
                            </a>
                        </c:forEach>
                      </div>
                </div>
                <!-- menu dọc end -->
                <div class="col">
                    <div class="row py-4 bg-info text-center text-white rounded"><strong>TIN TỨC</strong> </div>
                    <c:forEach items="${listNews}" var="news">
                        <div class="row">
                            <div id="hover" class="hover py-1">
                                <a href="newsDetail?newsId=${news.newsId}" class="text-decoration-none text-reset " ><h5>${news.newsTitle}</h5></a>
                            </div>
                        </div>
                        <div class="row">
                            <a href="newsDetail?newsId=${news.newsId}"><img style="max-height: 375px; max-width: 845px;" src="<c:url value="/sources"/>/img/${news.newsImage}" alt="${news.newsImage}"></a>
                        </div>
                        <div class="row text-secondary">
                            <p>${news.newsDescription}</p>
                        </div>
                    </c:forEach>
                    <div class="row my-3">
                        <nav aria-label="...">
					        <ul class="pagination justify-content-center">
					            <li class="page-item">
					                <a class="page-link" href="getNews?page=${previous}">Previous</a>
					            </li>
					            <c:forEach items="${listPage}" var="page">
					                <li class="page-item pageLink">
					                    <a class="page-link" href="getNews?page=${page}">${page}</a>
					                </li>
					            </c:forEach>
					            <li class="page-item ">
                                	<a class="page-link" href="getNews?page=${next}">Next</a>
                                </li>
					        </ul>
					   </nav>
                    </div>
                </div>
            </div>
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