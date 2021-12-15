<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Opret bruger
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-6 introtext">
                        <div class="pageheadline">
                            <h1>Opret bruger</h1>
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
                                        <form action="${pageContext.request.contextPath}/fc/registercommand" method="post">
                                            <div style="padding-bottom: 35px">
                                                <div style="padding-bottom: 10px">
                                                    <label for="firstname" style="font-weight: bold">Fornavn</label>
                                                    <input type="text" id="firstname" name="firstname" class="white-input" placeholder="Skriv dit fornavn">
                                                </div>
                                                <div>
                                                    <label for="lastname" style="font-weight: bold">Efternavn</label>
                                                    <input type="text" id="lastname" name="lastname" class="white-input"
                                                           placeholder="Skriv dit efternavn">
                                                </div>
                                            </div>
                                            <div style="padding-bottom: 35px">
                                                <div>
                                                    <label for="email" style="font-weight: bold">E-mail</label>
                                                    <input type="text" id="email" name="email" class="white-input" placeholder="Skriv din e-mail">
                                                </div>
                                            </div>
                                            <div style="padding-bottom: 35px">
                                                <div style="padding-bottom: 10px">
                                                    <label for="password1" style="font-weight: bold">Adgangskode</label>
                                                    <input type="password" id="password1" name="password1" class="white-input" placeholder="Skriv adgangskode">
                                                </div>

                                                <div>
                                                    <label for="password2" style="font-weight: bold">Adgangskode igen</label>
                                                    <input type="password" id="password2" name="password2" class="white-input"
                                                           placeholder="Skriv adgangskoden igen">
                                                </div>
                                            </div>
                                            <div style="padding-bottom: 35px">
                                                <div>
                                                    <label for="phonenr" style="font-weight: bold">Telefon</label>
                                                    <input type="text" id="phonenr" name="phonenr" class="white-input"
                                                           placeholder="Skriv dit telefon-nummer">
                                                </div>
                                            </div>
                                            <div style="padding-bottom: 35px">
                                                <div class="row" style="padding-bottom: 10px">
                                                    <div class="col-xs-9">
                                                        <label for="streetname" style="font-weight: bold">Vejnavn</label>
                                                        <input type="text" id="streetname" name="streetname" class="white-input"
                                                               placeholder="Skriv vejnavn">
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label for="housenr" style="font-weight: bold">nr.</label>
                                                        <input type="text" id="housenr" name="housenr" class="white-input"
                                                               placeholder="Skriv hus nr.">
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-9">
                                                        <label for="city" style="font-weight: bold">By</label>
                                                        <input type="text" id="city" name="city" class="white-input"
                                                               placeholder="Skriv by">
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label for="zipcode" style="font-weight: bold">zip</label>
                                                        <input type="text" id="zipcode" name="zipcode" class="white-input"
                                                               placeholder="Skriv zip">
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="row" style="padding-top: 20px">
                                                <div class="col-xs-6">
                                                    <a href="${pageContext.request.contextPath}/fc/loginpage" class="grey-button">Fortryd</a>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="submit" class="green-button" value="opret nu">
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


