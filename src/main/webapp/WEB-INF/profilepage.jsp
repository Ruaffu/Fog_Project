<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Min profil
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-6 introtext">
                        <div class="pageheadline setbreadcrumb">
                            <h1 class="active">Min profil</h1>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <section>
            <div class="container">
                <div class="row">
                    <div class="article-page">
                        <div class="col-md-3 article-page-menu mobile-navigation">
                            <ul class="nav nav-pills nav-stacked" style="padding-bottom: 20px">
                                <li style="width: 100%;" class="active">
                                    <a href="${pageContext.request.contextPath}/fc/profilepage">Mine oplysninger</a>
                                </li>
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/logoutpage">Log ud</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <div class="xhtml-string">
                                <h2>Mine Oplysninger</h2>

                                <div class="alert alert-info">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div>
                                                <div>
                                                    <label style="font-weight: bold">Fornavn:</label>
                                                </div>
                                                <div>
                                                    <p>${sessionScope.user.firstname}</p>
                                                </div>
                                            </div>


                                            <div>
                                                <div>
                                                    <label>Efternavn:</label>
                                                </div>
                                                <div>
                                                    <p>${sessionScope.user.lastname}</p>
                                                </div>
                                            </div>

                                            <div>
                                                <div>
                                                    <label>E-mail:</label>
                                                </div>
                                                <div>
                                                    <p>${sessionScope.user.email}</p>
                                                </div>
                                            </div>
                                            <div>
                                                <div>
                                                    <label>Telefon:</label>
                                                </div>
                                                <div>
                                                    <p>${sessionScope.user.phoneNr}</p>
                                                </div>
                                            </div>
                                            <div>
                                                <div>
                                                    <label>Adresse:</label>
                                                </div>
                                                <div>
                                                    <p>${sessionScope.user.streetname} nr. ${sessionScope.user.houseNr}, ${sessionScope.user.city} ${sessionScope.user.zipcode}</p>
                                                </div>
                                            </div>
                                            <a href="${pageContext.request.contextPath}/fc/editprofilepage" class="blue-button">
                                                ændre profil
                                            </a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </jsp:body>
</t:genericpage>