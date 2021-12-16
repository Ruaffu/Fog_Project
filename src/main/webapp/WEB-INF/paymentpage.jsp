<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Betaling
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-6 introtext">
                        <div class="pageheadline">
                            <h1>Betaling</h1>
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
                                <form action="${pageContext.request.contextPath}/fc/orderpage" method="post">
                                    <div class="row">

                                        <div class="col-xs-6">
                                            <h2>Betal: ${sessionScope.payorder.totalPrice} kr.</h2>

                                            <form action="${pageContext.request.contextPath}/fc/registercommand"
                                                  method="post">
                                                <div style="padding-bottom: 35px">
                                                    <div>
                                                        <label style="font-weight: bold"> Accepted cards</label><br>
                                                        <i class="fa fa-cc-visa" style="color:navy; font-size: 50px"></i>
                                                        <i class="fa fa-cc-mastercard" style="color:red; font-size: 50px"></i>
                                                    </div>
                                                </div>
                                                <h3>Indtast oplysninger</h3>
                                                <div style="padding-bottom: 35px">
                                                    <div style="padding-bottom: 10px">
                                                        <label for="cardholdername"
                                                               style="font-weight: bold">Navn</label>
                                                        <input type="text" id="cardholdername" name="cardholdername"
                                                               placeholder="Alice Heywood" class="white-input">
                                                    </div>
                                                    <div>
                                                        <label for="cardnr" style="font-weight: bold">Kort
                                                            nummer</label>
                                                        <input type="text" id="cardnr" name="cardnr"
                                                               placeholder="1111-2222-3333-4444" class="white-input">
                                                    </div>
                                                </div>
                                                <div style="padding-bottom: 35px">
                                                    <div>
                                                        <label for="expmonth" style="font-weight: bold">Expiry
                                                            month</label>
                                                        <input type="text" id="expmonth" name="expmonth"
                                                               placeholder="November" class="white-input">
                                                    </div>
                                                </div>

                                                <div style="padding-bottom: 35px">
                                                    <div class="row" style="padding-bottom: 10px">
                                                        <div class="col-xs-6">
                                                            <label for="expyear" style="font-weight: bold">Expiry
                                                                year</label>
                                                            <input type="text" id="expyear" name="expyear"
                                                                   placeholder="2022" class="white-input">
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label for="cvv" style="font-weight: bold">CVV</label>
                                                            <input type="text" id="cvv" name="cvv" placeholder="123"
                                                                   class="white-input">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row" style="padding-top: 20px">
                                                    <div class="col-xs-6">
                                                        <a href="${pageContext.request.contextPath}"
                                                           class="grey-button">Fortryd</a>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <input type="submit" class="green-button" value="Betal">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </jsp:body>
</t:genericpage>


