<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Ændre profil
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-6 introtext">
                        <div class="pageheadline setbreadcrumb">
                            <h1>Min profil</h1>
                            <p class="split">></p>
                            <span class="active">Ændre i profil</span>
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
                                <div class="col-xs-12">
                                    <h3>Indtast oplysninger</h3>
                                    <form action="${pageContext.request.contextPath}/fc/editusercommand" method="post">
                                        <div style="padding-bottom: 35px">
                                            <div style="padding-bottom: 10px">
                                                <label for="firstname" style="font-weight: bold">Fornavn</label>
                                                <input type="text" class="white-input" id="firstname" name="firstname"
                                                       value="${sessionScope.user.firstname}">
                                            </div>
                                            <div>
                                                <label for="lastname" style="font-weight: bold">Efternavn</label>
                                                <input type="text" class="white-input" id="lastname" name="lastname"
                                                       value="${sessionScope.user.lastname}">
                                            </div>
                                        </div>
                                        <div style="padding-bottom: 35px">
                                            <div>
                                                <label for="email" style="font-weight: bold">E-mail</label>
                                                <input type="text" class="white-input" id="email" name="email" value="${sessionScope.user.email}">
                                            </div>
                                        </div>
                                        <div style="padding-bottom: 35px">
                                            <div>
                                                <label for="phonenr" style="font-weight: bold">Telefon</label>
                                                <input type="text" class="white-input" id="phonenr" name="phonenr"
                                                       value="${sessionScope.user.phoneNr}">
                                            </div>
                                        </div>
                                        <div style="padding-bottom: 35px">
                                            <div class="row" style="padding-bottom: 10px">
                                                <div class="col-xs-9">
                                                    <label for="streetname" style="font-weight: bold">Vejnavn</label>
                                                    <input type="text" class="white-input" id="streetname" name="streetname"
                                                           value="${sessionScope.user.streetname}">
                                                </div>
                                                <div class="col-xs-3">
                                                    <label for="housenr" style="font-weight: bold">nr.</label>
                                                    <input type="text" class="white-input" id="housenr" name="housenr"
                                                           value="${sessionScope.user.houseNr}">
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-xs-9">
                                                    <label for="city" style="font-weight: bold">By</label>
                                                    <input type="text" class="white-input" id="city" name="city"
                                                           value="${sessionScope.user.city}">
                                                </div>
                                                <div class="col-xs-3">
                                                    <label for="zipcode" style="font-weight: bold">zip</label>
                                                    <input type="text" class="white-input" id="zipcode" name="zipcode"
                                                           value="${sessionScope.user.zipcode}">
                                                </div>

                                            </div>
                                        </div>
                                        <div class="row" style="padding-top: 20px">
                                            <div class="col-xs-6">
                                                <a href="${pageContext.request.contextPath}/fc/profilepage" class="grey-button">Fortryd</a>
                                            </div>
                                            <div class="col-xs-6">
                                                <input type="submit" class="green-button" value="Gem">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </jsp:body>
</t:genericpage>