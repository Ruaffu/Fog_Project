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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pathway+Gothic+One&display=swap" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
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
<header class="bannershow">
    <nav>
        <div class="container responsive-header">
            <div class="navwrapper">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-xs-12">
                                <div>
                                    <div class="logo">
                                        <a href="<%=request.getContextPath()%>">
                                            <img src="${pageContext.request.contextPath}/images/logo.png"
                                                 class="img-responsive">
                                        </a>
                                    </div>
                                </div>
                                <div style="padding-top: 2%">
                                    <c:set var="thisPage" value="${pageContext.request.servletPath}"/>
                                    <c:set var="isNotLoginPage" value="${!fn:endsWith(thisPage,'loginpage.jsp')}"/>
                                    <c:set var="isNotRegisterPage"
                                           value="${!fn:endsWith(thisPage,'registerpage.jsp')}"/>

                                    <div class="col-xs-2 pull-left">
                                        <c:if test="${isNotLoginPage && isNotRegisterPage}">
                                            <c:if test="${sessionScope.user == null }">
                                                <a href="${pageContext.request.contextPath}/fc/loginpage"
                                                   class="nav-button"><i class="jf-icon-human-check fa fa-user"></i>
                                                    Login
                                                </a>

                                            </c:if>
                                            <c:if test="${sessionScope.user != null}">
                                                <a class="nav-button"
                                                   href="${pageContext.request.contextPath}/fc/profilepage">
                                                    <h4><i class="fas">&#xf2bd;</i> Min profil</h4>
                                                </a>

                                            </c:if>
                                        </c:if>
                                    </div>
                                    <div class="col-xs-7 pull-right">
                                        <c:if test="${sessionScope.user.role != 'employee' && sessionScope.user.role != 'customer'}">
                                            <div class="col-xs-4"></div>
                                            <div class="col-xs-4"></div>
                                            <div class="col-xs-4">
                                                <a href="${pageContext.request.contextPath}/fc/requestcarportpage"
                                                   class="nav-button" style="text-align: right;">Lav carport</a>
                                            </div>
                                        </c:if>
                                        <c:if test="${sessionScope.user.role.equals('employee')}">
                                        <div class="col-xs-3">
                                            <a href="${pageContext.request.contextPath}/fc/retrieverequestcommand"
                                               class="nav-button" style="text-align: right;">Forespørgsler
                                                <c:set var="index" value="0"></c:set>
                                                <c:forEach items="${sessionScope.allrequests}" var="request">
                                                    <c:if test="${request.status.equals('request')}">
                                                        <input type="hidden" name="request"
                                                               value="${index = index + 1}">
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${index != 0}">
                                                        <span class="badge">
                                                                ${index}
                                                        </span>
                                                </c:if>
                                            </a>
                                        </div>
                                        <div class="col-xs-3">
                                            <a href="${pageContext.request.contextPath}/fc/allorderpage"
                                               class="nav-button" style="text-align: right;">Ordre
                                                <c:set var="index" value="0"></c:set>
                                                <c:forEach items="${sessionScope.allorders}" var="accepted">
                                                    <c:if test="${accepted.status.equals('accepted')}">
                                                        <input type="hidden" name="request"
                                                               value="${index = index + 1}">
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${index != 0}">
                                                        <span class="badge">
                                                                ${index}
                                                        </span>
                                                </c:if>
                                            </a>
                                        </div>
                                        <div class="col-xs-3">
                                            <a href="${pageContext.request.contextPath}/fc/allcustomercommand"
                                               class="nav-button" style="text-align: right;">Kunder</a>
                                        </div>
                                        <div class="col-xs-3">
                                            <a href="${pageContext.request.contextPath}/fc/materiallistcommand"
                                               class="nav-button" style="text-align: right;">Materialer</a>
                                        </div>

                                        <c:if test="${sessionScope.user.role.equals('customer')}">
                                        <div class="col-xs-4">
                                            <a href="${pageContext.request.contextPath}/fc/offerpage"
                                               class="nav-button" style="text-align: right;">Forespørgsler
                                                <c:set var="index" value="0"></c:set>
                                                <c:forEach items="${sessionScope.customerrequests}" var="offer">
                                                    <c:if test="${offer.status.equals('offer')}">
                                                        <input type="hidden" name="request"
                                                               value="${index = index + 1}">
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${index != 0}">
                                                    <span class="badge">
                                                            ${index}
                                                    </span>
                                                </c:if>
                                            </a>
                                        </div>
                                        <div class="col-xs-4">
                                            <a href="${pageContext.request.contextPath}/fc/orderpage"
                                               class="nav-button" style="text-align: right;">Ordre</a>
                                        </div>
                                        <div class="col-xs-4">
                                            <a href="${pageContext.request.contextPath}/fc/requestcarportpage"
                                               class="nav-button" style="text-align: right;">Lav carport</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>


<jsp:doBody/>

<jsp:invoke fragment="footer"/>
<footer>
    <div class="prefooter-bg"
         style="background: url('${pageContext.request.contextPath}/images/johannes-fog-tb.png') no-repeat center center;">
        <div class="container prefooter">
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <a href="">
                        <h3>Butikker</h3>
                        <img src="${pageContext.request.contextPath}/images/butikkertb_footer.jpg">
                    </a>
                </div>
                <div class="col-md-3 col-xs-6">
                    <a href="">
                        <h3>Service</h3>
                        <img src="${pageContext.request.contextPath}/images/tramand_lille.jpg">
                    </a>
                </div>
                <div class="col-md-3 col-xs-6">
                    <a href="">
                        <h3>Udlejning</h3>
                        <img src="${pageContext.request.contextPath}/images/col4.png">
                    </a>
                </div>
                <div class="col-md-3 col-xs-6">
                    <a href="">
                        <h3>Bliv kunde i Fog</h3>
                        <img src="${pageContext.request.contextPath}/images/bliv-kunde-i-fog.jpg">
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <i class="default-line-color"></i>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="row-with-btn">
                        <p>Tilmeld dig vores tilbudsmail og få udvalgte tilbud direkte i indbakken</p>
                        <a href="" class="btn btn-info pull-right">Tilmeld</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container footer">
        <div class="row">
            <div class="col-md-3">
                <div class="responsive-collapse">
                    <h3 class="heading trigger">Hvordan køber jeg?</h3>
                    <i class="default-line-color"></i>
                    <div class="content">
                        <ul>
                            <li><a>Ofte stillede spørgsmål</a></li>
                            <li><a>Fragt</a></li>
                            <li><a>Fortrydelse & returnering</a></li>
                            <li><a>Reklamation & klage</a></li>
                            <li><a>E-mærket</a></li>
                            <li><a>Købs- og leveringsvilkår online</a></li>
                            <li><a>Alm. salgs- og leveringsbetingelser</a></li>
                            <li><a>Bliv kunde i Fog</a></li>
                            <li><a>Fog Konto</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="responsive-collapse">
                    <h3 class="heading trigger">Aktuelt</h3>
                    <i class="default-line-color"></i>
                    <div class="content">
                        <ul>
                            <li><a>Tilbudsavis</a></li>
                            <li><a>Blog</a></li>
                            <li><a>Nej Tak+</a></li>
                            <li><a>Tilbudssmail</a></li>
                            <li><a>Konkurrencer</a></li>
                            <li><a>Facebook</a></li>
                            <li><a>Instagram</a></li>
                            <li><a>LinkedIn</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="responsive-collapse">
                    <h3 class="heading trigger">Om Fog</h3>
                    <i class="default-line-color"></i>
                    <div class="content">
                        <ul>
                            <li><a>Åbningstider</a></li>
                            <li><a>Om Fog</a></li>
                            <li><a>Fogs Fond</a></li>
                            <li><a>Job</a></li>
                            <li><a>CSR</a></li>
                            <li><a>Cookie- politik</a></li>
                            <li><a>Persondata</a></li>
                            <li><a>Prismatch</a></li>
                            <li><a>Spørg Fog</a></li>
                            <li><a>Kontakt Fog</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="contact">
                    <div class="contact-row" style="padding-bottom: 20px;">
                        <div class="contact-row" style="padding-bottom: 20px;">
                            <div class="contact-icon fa fa-users" style="font-size: 30px;"></div>
                            <div class="contact-info" style="line-height: 20px;">Webshop</div>
                        </div>
                        <div class="contact-row" style="padding-bottom: 20px;">
                            <div class="contact-icon fa fa-phone" style="font-size: 30px;"></div>
                            <div class="contact-info" style="line-height: 20px;">47 16 08 00</div>
                        </div>
                        <div class="contact-row" style="padding-bottom: 20px;">
                            <div class="contact-icon fa fa-envelope" style="font-size: 30px;"></div>
                            <div class="contact-info" style="line-height: 20px;">
                                <a href="">Send e-mail</a>
                            </div>
                        </div>
                        <i class="default-line-color"></i>
                        <div class="contact-icon fa fa-users" style="font-size: 30px;"></div>
                        <div class="contact-info" style="line-height: 20px;">Johannes Fog</div>
                    </div>
                    <div class="contact-row" style="padding-bottom: 20px;">
                        <div class="contact-icon fa fa-phone" style="font-size: 30px"></div>
                        <div class="contact-info" style="line-height: 20px">45 87 10 01</div>
                    </div>
                    <div class="contact-row" style="padding-bottom: 20px;">
                        <div class="contact-icon fa fa-envelope" style="font-size: 30px;"></div>
                        <div class="contact-info" style="line-height: 20px">
                            <a href=""> Send e-mail</a>
                        </div>
                    </div>
                    <div class="contact-row" style="padding-bottom: 20px;">
                        <img src="${pageContext.request.contextPath}/images/cards-logos.png">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="subfooter">
        <div class="container">
            <div class="pull-left">Johannes Fog A/S - Firskovvej 20 - 2800 Lyngby - CVR-nr. 16314439</div>
            <div class="pull-right">Alle priser er inkl. moms</div>
        </div>
    </div>
</footer>

</body>
</html>