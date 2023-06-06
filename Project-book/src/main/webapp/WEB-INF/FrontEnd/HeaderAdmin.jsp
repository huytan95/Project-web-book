<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
    <!-- menu top -->
    <section class="header">
        <div class="container">
            <div class="row py-2 text-center">
                <!-- logo -->
                <div class="col-md-3">
                    <h2>SCIUTO'S </h2>
                </div>
                <!-- logo end -->
                <!-- tim kiem -->
                <div class="col-md-7 ">
                </div>
                <!-- tim kiem end-->
                <div class="col-md-2">
                    <nav class="navbar navbar-expand-lg navbar-dark pt-0">
                        <div class="container-fluid">
                            <a class="navbar-brand text-info" href="#"><i class="fa-solid fa-bell"></i></a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                                <ul class="navbar-nav">
                                    <li class="nav-item dropdown">
                                        <button class="btn dropdown-toggle text-info" data-bs-toggle="dropdown"
                                            aria-expanded="false">
                                            <i class="fa-solid fa-user"></i>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><i class="fa-solid fa-user"></i>${user.fullName}</a></li>
                                            <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                    <i class="fa-solid fa-right-from-bracket"></i> Logout</a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- menu top end-->
    <!-- body -->
    <section class="body">
        <div class="container">
            <div class="row">
                <!-- menu dọc -->
                <div class="col-md-3">
                    <div class="list-group">
                        <a href="admin-dashboard" class="list-group-item list-group-item-action border-0  active" aria-current="true">
                            Dashboard
                        </a>
                        <a href="admin-listOderAdmin" class="list-group-item list-group-item-action border bg-info active"
                            aria-current="true">
                            <i class="fa-solid fa-cart-shopping"></i> Quản lý đơn hàng
                        </a>
                        <a href="admin-listProductAdmin" class="list-group-item list-group-item-action border bg-info active"
                            aria-current="true">
                            <i class="fa-brands fa-product-hunt"></i> Quản lý sản phẩm
                        </a>
                        <a href="admin-listUser" class="list-group-item list-group-item-action border bg-info active"
                            aria-current="true">
                            <i class="fa-solid fa-user"></i> Quản lý tài khoản
                        </a>
                        <a href="admin-loadCategories" class="list-group-item list-group-item-action border bg-info active">
                        	<i class="fa-solid fa-list"></i> Quản lý danh mục sản phẩm
                        </a>
                        <a href="admin-InformationWebAd" class="list-group-item list-group-item-action border bt-dark bg-info active">
                        	<i class="fa-solid fa-address-card"></i> Thông tin liên lạc
                        </a>
                        <a href="admin-introductionAdmin"
							class="list-group-item list-group-item-action border bt-dark bg-info active" aria-current="true">
							<i class="fa-brands fa-weixin"></i> Giới thiệu web
						</a>
						<a href="admin-policyAdmin"
							class="list-group-item list-group-item-action border bt-dark bg-info active" aria-current="true">
							<i class="fa-solid fa-building-shield"></i> Chính sách bán hàng
						</a>
                        <a href="admin-getMail"
							class="list-group-item list-group-item-action border bt-dark bg-info active" aria-current="true">
							<i class="fa-regular fa-envelope"></i> Mail tự động
						</a>
                        <a href="getNewsAdmin"
							class="list-group-item list-group-item-action border bt-dark bg-info active" aria-current="true">
							<i class="fa-regular fa-newspaper"></i> Tin tức
						</a>
                        <a href="listCommentAdmin"
							class="list-group-item list-group-item-action border bt-dark bg-info active" aria-current="true">
							<i class="fa-regular fa-comment"></i> Bình luận
						</a>
                        <a href="admin-listMessageAdmin"
							class="list-group-item list-group-item-action border bt-dark bg-info active" aria-current="true">
							<i class="fa-regular fa-message"></i> Tin nhắn
						</a>
                    </div>
                </div>
                <!-- menu dọc end-->
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
                 Kết thúc phiên làm việc bằng việc ấn 'Đăng xuất' bên dưới
               </div>
               <div class="modal-footer">
                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                 <a class="btn btn-primary" href="logout"> Đăng xuất</a>
               </div>
             </div>
           </div>
         </div>
