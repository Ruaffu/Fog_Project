<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Payment
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>

        <div class="grey-large-container">
            <div class="white-small-box">
                <div class="large-title-grid-element">
                    <div class="center-text">
                        <h1>Payment <i class="fas">&#xf09d;</i></h1>
                    </div>
                </div>
                <form action="${pageContext.request.contextPath}/fc/orderpage" method="post">
                    <div class="row-5-grid" style="gap: 45px">
                        <div>
                            <label style="font-size: 25px; color: #3D3D3D; font-weight: bold">Payment amount:</label> <br>
                            <c:if test="${sessionScope.payorder != null}">
                                <label style="font-size: 25px; color: #3D3D3D; font-weight: bold">${sessionScope.payorder.totalPrice} kr.</label>
                            </c:if>
                        </div>

                        <div>
                            <label class="small-title-label"> Accepted cards</label><br>
                            <i class="fa fa-cc-visa" style="color:navy; font-size: 50px"></i>
                            <i class="fa fa-cc-mastercard" style="color:red; font-size: 50px"></i>

                        </div>

                        <div>
                            <label for="cardholdername" class="small-title-label">Cardholder's name</label><br>
                            <input class="border-input-text" type="text" id="cardholdername" name="cardholdername"
                                   placeholder="Alice Heywood"><br>
                        </div>

                        <div>
                            <label for="cardnr" class="small-title-label">Card number</label><br>
                            <input class="border-input-text" type="text" id="cardnr" name="cardnr"
                                   placeholder="1111-2222-3333-4444"><br>
                        </div>

                        <div>
                            <label for="expmonth" class="small-title-label">Expiry month</label><br>
                            <input class="border-input-text" type="text" id="expmonth" name="expmonth"
                                   placeholder="November"><br>
                        </div>

                        <div class="col-2-grid" style="gap: 25px">
                            <div>
                                <label for="expyear" class="small-title-label">Expiry year</label><br>
                                <input class="border-input-text" type="text" id="expyear" name="expyear"
                                       placeholder="2022"><br>
                            </div>
                            <div>
                                <label for="cvv" class="small-title-label">CVV</label><br>
                                <input class="border-input-text" type="text" id="cvv" name="cvv" placeholder="123"><br>
                            </div>
                        </div>
                        <div style="padding-top: 35px">
                            <input class="green-large-button" type="submit" value="Pay now">
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </jsp:body>
</t:genericpage>


