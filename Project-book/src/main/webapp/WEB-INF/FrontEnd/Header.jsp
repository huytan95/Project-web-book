<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>Trang chủ</title>

</head>

<body>
	<section class="headerMenu">
		<div class="container">
			<div class="row " style="font-size: 12px;">
				<div class="col-md-8 bg-info text-white py-2 d-flex align-items-center">
					<i class="fa-solid fa-envelope mx-1"></i>${contact.email }
					<i class="fa-solid fa-phone mx-2"></i>
					    ${contact.phone.substring(0,4)} ${contact.phone.substring(4,7)} ${contact.phone.substring(7,10)}
				</div>
				<div class="col-md-4 bg-info text-white">
					<div class="row text-center">
						<div class="col-md-2 fs-5 d-flex align-items-center justify-content-center" style="border-left: 1px solid white;">
							<a href="#" class="text-decoration-none text-reset"><i
								class="fa-brands fa-facebook "></i></a>
						</div>
						<div class="col-md-2 fs-5 d-flex align-items-center justify-content-center" style="border-left: 1px solid white;">
							<a href="#" class="text-decoration-none text-reset"><i
								class="fa-brands fa-instagram"></i></a></i>
						</div>
						<div class="col-md-2 fs-5 d-flex align-items-center justify-content-center" style="border-left: 1px solid white;">
							<a href="#" class="text-decoration-none text-reset"><i
								class="fa-brands fa-twitter"></i></a>
						</div>
						<c:choose>
						<c:when test="${user.fullName==null}">
                            <div class="col-md-3 py-2 text-decoration-none"
                                style="border-left: 1px solid white;">
                                <a href="register"
                                    class="text-decoration-none text-reset">Đăng ký</a>
                            </div>
                            <div class="col-md-3 py-2" style="border-left: 1px solid white;">
                                <a href="login"
                                    class="text-decoration-none text-reset">Đăng nhập</a>
                            </div>
						</c:when>
						<c:otherwise>
						    <div class="col-md-3 py-2 d-flex align-items-center justify-content-center text-decoration-none"
                                    style="border-left: 1px solid white;">
                                <a href="#" class="text-decoration-none text-reset">${user.fullName}</a>
                            </div>
                            <div class="col-md-3 py-2 d-flex align-items-center justify-content-center"
                                 style="border-left: 1px solid white;">
                                <ul class="navbar-nav">
                                    <li class="nav-item dropdown">
                                        <button class="btn dropdown-toggle text-white" data-bs-toggle="dropdown"
                                            aria-expanded="false">
                                            <i class="fa-solid fa-user"></i>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu">
                                            <li><a class="dropdown-item" href="preUpdateInforUser">
                                                    <i class="fa-solid fa-screwdriver-wrench"></i> Thay đổi thông tin</a></li>
                                            <li><a class="dropdown-item" href="listOder">
                                                    <i class="fa-solid fa-cart-shopping"></i> Đơn mua</a></li>
                                            <li><a class="dropdown-item" href="preChangePasswordUser">
                                                    <i class="fa-solid fa-key"></i> Đổi mật khẩu</a></li>
                                            <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                    <i class="fa-solid fa-right-from-bracket"></i> Đăng xuất</a></li>
                                        </ul>
                                    </li>
							    </ul>
                            </div>
                        </c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="header">
		<div class="container">
			<div class="row py-3 text-center">
				<div class="col-md-3">
					<a href="home">
						<img src="<c:url value="/sources"/>/img/${imageLogo.imageName}" class="img-fluid" alt="${imageLogo.imageName}">
					</a>
				</div>


				<div class="col-md-5 py-4">
					<form action="searchProductUser">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="tìm kiếm..."
								name = "productName"
								aria-describedby="basic-addon2">
							<button type="submit" class="btn btn-primary">
								<i class="fa-sharp fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</form>
				</div>

			<div class="col-md-3 bg-info my-4 rounded text-white py-2"
				style="height: 40px;">
				<i class="fa-solid fa-bag-shopping"></i> <a href="listCart"
					class="text-decoration-none text-reset">GIỎ HÀNG: ${totalQuantity} SẢN PHẨM</a>
			</div>
			</div>
		</div>

	</section>
	<section class="mainmenu bg-dark">
		<div class="container ">
			<div class="row">
				<div class="col-md-8">
					<ul class="nav nav-pills ">
						<li class="nav-item"><a class="nav-link active bg-info"
							aria-current="page" href="home">TRANG CHỦ</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-white"
							data-bs-toggle="dropdown" href="#" role="button"
							aria-expanded="false">SẢN PHẨM</a>
							<ul class="dropdown-menu">
								<c:forEach items="${listCate }" var="cate">
									<li><a class="dropdown-item"
										class="text-decoration-none text-reset" href="loadProductUser?cateId=${cate.cateId}">${cate.cateName }</a></li>
								</c:forEach>
							</ul>
							</li>
						<li class="nav-item" style="border-left: 1px solid white;"><a
							class="nav-link text-white"
							class="text-decoration-none text-reset" href="getNews">TIN TỨC</a></li>
						<li class="nav-item" style="border-left: 1px solid white;"><a
							class="nav-link text-white"
							class="text-decoration-none text-reset" href="contact">LIÊN
								HỆ</a></li>
						<li class="nav-item" style="border-left: 1px solid white;"><a
							class="nav-link text-white"
							class="text-decoration-none text-reset" href="introductionUser">GIỚI THIỆU</a></li>
						<li class="nav-item" style="border-left: 1px solid white;"><a
							class="nav-link text-white"
							class="text-decoration-none text-reset" href="policyUser">CHÍNH SÁCH</a></li>
					</ul>
				</div>
				<div class="col-md-4"></div>
			</div>

		</div>
	</section>
<!-- Logout Modal-->
         <!-- Modal -->
         <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog">
             <div class="modal-content">
               <div class="modal-header">
                 <h1 class="modal-title fs-5" id="exampleModalLabel">Bạn muốn đăng xuất?</h1>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                 Kết thúc phiên mua sắm bằng việc ấn 'Đăng xuất' bên dưới:
               </div>
               <div class="modal-footer">
                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                 <a class="btn btn-primary" href="logout"> Đăng xuất</a>
               </div>
             </div>
           </div>
         </div>