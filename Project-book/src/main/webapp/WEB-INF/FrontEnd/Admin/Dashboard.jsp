<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="<c:url value="/sources/css/sb-admin-2.css" />" rel="stylesheet" type="text/css" />

    <title>Trang Dashboard</title>

    <c:set value="/WEB-INF/FrontEnd/HeaderAdmin.jsp" var="headAdminURL" scope="application" />
    <jsp:include page="${headAdminURL}"></jsp:include>
</head>
<body>
	<div class="col-md-9">
					<div class="row">
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-md-3" style="max-height:100px;">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Doanh thu (tháng)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                <fmt:formatNumber value="${totalPrice}" pattern="#,##0đ"/>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="max-height:100px;">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Tổng đơn hàng (tháng)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalOrder}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa-solid fa-cart-shopping text-gray-300" style="font-size:30px"></i>
                                        </div >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="max-height:100px;">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                               Đơn hoàn thành</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalOrderSuccess}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa-solid fa-cart-shopping text-gray-300" style="font-size:30px"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="max-height:100px;">
                            <div class="card border-left-danger shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                               Đơn hủy</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalOrderCancel}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa-solid fa-cart-shopping text-gray-300" style="font-size:30px"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
					</div>
					<div class = "row py-3">
                    <!-- Area Chart -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                Biểu đồ doanh thu theo tháng
                            </div>
                            <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
                            <fmt:formatDate value="${currentTime}" pattern="HH:mm:ss dd-MM-yyyy " var="formattedTime" />
                            <div class="card-footer small text-muted">Cập nhật: ${formattedTime}</div>
                        </div>
					</div>
	</div>

</body>
    <!-- footter -->
    <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
        © 2023 Object:
        <a class="text-reset fw-bold" href="#">vesion v1.0</a>
    </div>
    <!-- footter end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
   	</script>
   	<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
    	integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous">
   	</script>
   	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
   	    integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous">
   	</script>
    <script type="text/javascript">
      (() => {
        'use strict'

        feather.replace({ 'aria-hidden': 'true' })
        const months =${months} ;
        const totalPrices = ${totalPrices};
        // Grap
        const ctx = document.getElementById('myChart')
        // eslint-disable-next-line no-unused-vars
        const myChart = new Chart(ctx, {
          type: 'line',
          data: {
            labels: months,
            datasets: [{
              data: totalPrices,
              lineTension: 0,
              backgroundColor: 'transparent',
              borderColor: '#007bff',
              borderWidth: 4,
              pointBackgroundColor: '#007bff'
            }]
          },
          options: {
            scales: {
              yAxes: [{
                ticks: {
                  beginAtZero: false
                }
              }]
            },
            legend: {
              display: false
            }
          }
        })
      })()
    </script>


</html>