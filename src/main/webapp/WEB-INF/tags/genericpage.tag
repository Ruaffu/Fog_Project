<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        <jsp:invoke fragment="header"/>
    </title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style1.css">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="theme-color" content="#7952b3">
</head>
<body>
<!--
    This header is inspired by this bootstrap
    example: https://getbootstrap.com/docs/5.0/examples/pricing/
-->
<header>

    <!-- NAVIGATION BAR -->
    <div class="topnav">

        <ul>
            <li>
                <c:set var="thisPage" value="${pageContext.request.servletPath}"/>
                <c:set var="isNotLoginPage" value="${!fn:endsWith(thisPage,'loginpage.jsp')}"/>
                <c:set var="isNotRegisterPage" value="${!fn:endsWith(thisPage,'registerpage.jsp')}"/>

                <c:if test="${isNotLoginPage && isNotRegisterPage}">
                    <c:if test="${sessionScope.user == null }">
                        <a class="purple-button"
                           href="${pageContext.request.contextPath}/fc/loginpage"><h4>
                            Login</h4></a>

                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                        <div class="dropdown">
                            <a class="purple-button"
                               href="${pageContext.request.contextPath}/fc/profilepage">
                                <h4>My profile</h4></a>
                            <div class="dropdown-content">
                                <a href="${pageContext.request.contextPath}/fc/profilepage">Profile</a>
                                <c:if test="${sessionScope.user.role.equals('customer')}">
                                    <a href="${pageContext.request.contextPath}/fc/offerpage">Offer</a>
                                    <a href="${pageContext.request.contextPath}/fc/orderpage">Order</a>
                                </c:if>
                                <a href="${pageContext.request.contextPath}/fc/logoutcommand">Sign out</a>
                            </div>
                        </div>
                    </c:if>
                </c:if>

            </li>

            <c:if test="${sessionScope.user.role != 'employee'}">
                <li>
                    <a class="white-button" href="${pageContext.request.contextPath}/fc/shoppingcartpage"><i
                            class="fas fa-shopping-cart"></i></a>
                </li>
                <li>
                    <a class="white-button" href="${pageContext.request.contextPath}/fc/finduspage"><h4>Find us</h4></a>
                </li>
                <li>
                    <a class="white-button" href="${pageContext.request.contextPath}/fc/requestpage"><h4>Shop</h4>
                    </a>
                </li>
            </c:if>

            <c:if test="${sessionScope.user.role.equals('employee')}">
                <li>
                    <a class="white-button" href="${pageContext.request.contextPath}/fc/productpage"><i
                            class="fas fa-store"></i></a>
                </li>
                <li>
                    <a class="white-button" href="${pageContext.request.contextPath}/fc/customerpage"><h4>Customers</h4>
                    </a>
                </li>
                <li>
                    <a class="white-button" href="${pageContext.request.contextPath}/fc/allorderpage"><h4>Orders</h4>
                    </a>
                </li>
                <li>
                    <a class="white-button" href="${pageContext.request.contextPath}/fc/retrieverequestcommand"><h4>Requests</h4>
                    </a>
                </li>
            </c:if>

            <li>
                <c:if test="${addHomeLink == null }">
                    <a class="white-button" href="<%=request.getContextPath()%>"><h4>Home</h4></a>
                </c:if>
            </li>
            <li style="float: left">
                <c:if test="${sessionScope.user != null}">
                    <label class="topnav-label"
                           style="padding-left: 200px">Hello, ${sessionScope.user.firstname}</label>
                </c:if>
            </li>
        </ul>
    </div>
</header>


<jsp:doBody/>

<jsp:invoke fragment="footer"/>
<!-- LOGO -->
<img class="img-logo" src="${pageContext.request.contextPath}/images/foglogo.png">

<div class="white-small-container">
    <div class="row-1-grid">
        <div class="box">
            <div class="box-content">
                <div class="row-3-grid">
                    <div class="center-text">
                        <h4 class="dark-purple">follow us</h4>
                    </div>
                    <div class="center-flex">
                        <a class="media"><i style="font-size:24px" class="fab">&#xf39e;</i></a>
                        <a class="media"><i style="font-size:24px" class="fab">&#xf0e1;</i></a>
                        <a class="media"><i style="font-size:24px" class="fab">&#xf231;</i></a>
                        <a class="media"><i style="font-size:24px" class="fab">&#xf2ac;</i></a>
                        <a class="media"><i style="font-size:24px" class="fab">&#xf099;</i></a></div>
                    <div class="m-p">
                        <div class="center-text">
                            <label class="small-label">Design by Christian, Leo & Mie</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>