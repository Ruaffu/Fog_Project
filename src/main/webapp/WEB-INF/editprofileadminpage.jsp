<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Ændre kundeoplysninger
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-12 introtext">
                        <div class="pageheadline setbreadcrumb">
                            <h1>Kundeoplysninger</h1>
                            <p class="split">></p>
                            <span>Detaljer</span>
                            <p class="split">></p>
                            <span class="active">Ændre kundeoplysninger</span>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <section>
            <div class="container">
                <div class="row">
                    <div class="article-page">
                        <div class="col-md-12">
                            <div class="xhtml-string">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <h3>Indtast oplysninger</h3>
                                        <form action="${pageContext.request.contextPath}/fc/editusercommand" method="post">
                                            <div style="padding-bottom: 35px">
                                                <div style="padding-bottom: 10px">
                                                    <label for="firstname" style="font-weight: bold">Fornavn</label>
                                                    <input type="text" id="firstname" name="firstname" class="white-input" value="${sessionScope.seemoreuser.firstname}">
                                                </div>
                                                <div>
                                                    <label for="lastname" style="font-weight: bold">Efternavn</label>
                                                    <input type="text" id="lastname" name="lastname" class="white-input"
                                                           value="${sessionScope.seemoreuser.lastname}">
                                                </div>
                                            </div>
                                            <div style="padding-bottom: 35px">
                                                <div>
                                                    <label for="email" style="font-weight: bold">E-mail</label>
                                                    <input type="text" id="email" name="email" class="white-input" value="${sessionScope.seemoreuser.email}">
                                                </div>
                                            </div>
                                            <div style="padding-bottom: 35px">
                                                <div>
                                                    <label for="phonenr" style="font-weight: bold">Telefon</label>
                                                    <input type="text" id="phonenr" name="phonenr" class="white-input"
                                                           value="${sessionScope.seemoreuser.phoneNr}">
                                                </div>
                                            </div>
                                            <div style="padding-bottom: 35px">
                                                <div class="row" style="padding-bottom: 10px">
                                                    <div class="col-xs-9">
                                                        <label for="streetname" style="font-weight: bold">Vejnavn</label>
                                                        <input type="text" id="streetname" name="streetname" class="white-input"
                                                               value="${sessionScope.seemoreuser.streetname}">
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label for="housenr" style="font-weight: bold">nr.</label>
                                                        <input type="text" id="housenr" name="housenr" class="white-input"
                                                               value="${sessionScope.seemoreuser.houseNr}">
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-9">
                                                        <label for="city" style="font-weight: bold">By</label>
                                                        <input type="text" id="city" name="city" class="white-input"
                                                               value="${sessionScope.seemoreuser.city}">
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label for="zipcode" style="font-weight: bold">zip</label>
                                                        <input type="text" id="zipcode" name="zipcode" class="white-input"
                                                               value="${sessionScope.seemoreuser.zipcode}">
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="row" style="padding-top: 20px">
                                                <div class="col-xs-6">
                                                    <a href="${pageContext.request.contextPath}/fc/customerdetailspage" class="grey-button">Fortryd</a>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="hidden" name="admin" value="true">
                                                    <input type="submit" class="green-button" value="gem">
                                                </div>
                                            </div>
                                        </form>
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