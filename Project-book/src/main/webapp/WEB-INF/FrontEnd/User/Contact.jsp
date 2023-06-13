<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.4.js"
    	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
    	crossorigin="anonymous"></script>
    <link href="<c:url value="/sources/css/scroll.css" />" rel="stylesheet" type="text/css" />
    <title>Trang liên hệ</title>

    <c:set value="/WEB-INF/FrontEnd/Header.jsp" var="headURL" scope="application" />
    <jsp:include page="${headURL}"></jsp:include>

</head>

<body>
    <!-- contact -->
    <section class="contact ">

        <div class="container">
            <div class="row d-inline ">
                <a href="home" class="text-dark p-0">Trang chủ</a>
                <a href="contact" class="text-dark p-0">/Liên hệ</a>
            </div>
            <!-- google map -->
            <div class="col-12 contact__map">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d1658.0988790328395!2d105.53236504150054!3d21.100374460318726!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1676380891277!5m2!1svi!2s"
                    class="w-100" height="300" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false"
                    tabindex="0"></iframe>
            </div>
            <!-- google map -->
            <!-- contact us -->
            <div class="row">
                <div class="content ">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-6 mr-auto">
                                <div class="mb-5">
                                    <h3 class="text-dark mb-4">LIÊN HỆ VỚI CHÚNG TÔI</h3>
                                    <p class="text-dark">Để không ngừng nâng cao chất lượng dịch vụ và đáp ứng tốt hơn
                                        nữa các yêu cầu sử dụng sách của Quý khách, chúng tôi mong muốn nhận được các
                                        thông tin phản hồi. Nếu Quý khách có bất kỳ thắc mắc hoặc đóng góp nào, xin vui
                                        lòng liên hệ với chúng tôi theo thông tin dưới đây. Chúng tôi sẽ phản hồi lại
                                        Quý khách trong thời gian sớm nhất.</p>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <h3 class="text-dark h5 mb-3">Hà Nội</h3>
                                        <ul class="list-unstyled mb-5">
                                            <li class="d-flex text-dark mb-2">
                                                <span class="mr-3"><span class="icon-map"></span></span> ${contact.address }
                                            </li>
                                            <li class="d-flex text-dark mb-2"><span class="mr-3">
                                                <span class="icon-phone"></span>
                                                ${contact.phone.substring(0,4)} ${contact.phone.substring(4,7)} ${contact.phone.substring(7,10)}
                                            </li>
                                            <li class="d-flex text-dark"><span class="mr-3"><span
                                                        class="icon-envelope-o"></span></span>${contact.email }</li>
                                        </ul>
                                    </div>

                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="box">
                                    <!-- form contact -->
                                    <h3 class="heading fs-4">ĐĂNG KÝ TƯ VẤN MIỄN PHÍ</h3>
                                    <h4 class="text-danger">${mess}</h4>
                                    <form:form class="mb-5" modelAttribute="message" method="post" action="insertMessage" onsubmit="return FormValidate();">
                                        <div class="row">
                                            <div class="col-md-12 form-group">
                                                <label for="name" class="col-form-label">Name</label>
                                                <span class="text-danger">*</span>
                                                <form:input path = "fullName" type="text" class="form-control" id="name"
                                                            value="${not empty user.fullName ? user.fullName : ''}"/>
                                                <c:if test="user != null">
                                                    <form:input path = "user.Id" type="hidden" class="form-control" id="userId"
                                                           value="${not empty user.id ? user.id : ''}"/>
                                                    <small class="text-danger" id="errName"></small>
                                                </c:if>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 form-group">
                                                <label for="email" class="col-form-label">Email</label>
                                                <span class="text-danger">*</span>
                                                <form:input path="email" type="text" class="form-control" id="email"
                                                    placeholder="you@example.com" value="${not empty user.email ? user.email : ''}"/>
                                                <small class="text-danger" id="errEmail"></small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 form-group">
                                                <label for="phoneNumber" class="col-form-label">Số điện thoại</label>
                                                <span class="text-danger">*</span>
                                                <form:input path="phoneNumber" type="text" class="form-control" id="phoneNumber"
                                                    placeholder="0..." value="${not empty user.phoneNumber ? user.phoneNumber : ''}"/>
                                                <small class="text-danger" id="errPhoneNumber"></small>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12 form-group">
                                                <label for="message" class="col-form-label">Nội dung thư</label>
                                                <span class="text-danger">*</span>
                                                <form:textarea path="message" maxlenght="1000" class="form-control" id="messageValue" cols="30"
                                                    rows="7"/>
                                                <small class="text-danger" id="errMessage"></small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col py-4 form-group">
                                                <button class="w-100 btn btn-info btn-lg text-white" type="submit">Gửi
                                                    thư</button>
                                            </div>
                                        </div>
                                    </form:form>
                                    <!-- form contact -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    <!-- contact -->

   <!-- Footer -->
       <c:set value="/WEB-INF/FrontEnd/Footer.jsp" var="footerURL" scope="application" />
       <jsp:include page="${footerURL}"></jsp:include>
   <!-- Footer end-->
    <!-- Back to top -->
    <a href="#" class="cd-top"><i
		    class="fa-solid fa-arrow-up-from-bracket"></i></a>
    <!-- Back to top end -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>
    <script type="text/javascript" src="<c:url value="/sources/js/scroll.js" />"> </script>
    <script type="text/javascript" src="<c:url value="/sources/js/contactUser.js" />"> </script>

</body>

</html>