<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Order details
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <div class="grey-large-container">
            <div class="white-large-box">
                <div class="row-2-grid" style="gap: 10px">
                    <div class="col-2-grid">
                        <div class="large-title-grid-element">
                            <div class="left-text">
                                <h1>Nr. ${sessionScope.makeoffer.id}</h1>
                                <h3><i class="fas">&#xf328;</i> Order details</h3>
                            </div>
                        </div>
                        <div class="right-text">
                            <h2>Status</h2>
                            <h3>${sessionScope.makeoffer.status}</h3>

                        </div>
                    </div>
                    <div>
                        <div class="left-text">
                            <div class="title-grid-element">
                                <div class="col-3-grid">
                                    <div class="left-grid">
                                        <h2>Order items</h2>
                                    </div>
                                    <div class="right-grid">
                                        <h3>${sessionScope.bomlist.size()} Total</h3>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <table class="collapse-table">
                            <tr class="table-labels">
                                <th class="left-text">PRODUCT DETAILS</th>
                                <th class="left-text">DESCRIPTION</th>
                                <th>QUANTITY</th>
                                <th>COST</th>
                                <th>PRICE</th>
                            </tr>
                            <c:set var="index" value="-1"/>
                            <c:forEach var="material" items="${sessionScope.bomlist}">
                                <tr>
                                    <th class="left-text">
                                        <h3>${material.name}</h3>
                                    </th>
                                    <th class="left-text">
                                        <h3>${material.description}</h3>
                                    </th>

                                        <th style="padding-right: 15px; width: 130px">
                                            <input name="quantity${index = index + 1}" class="border-input-text"
                                                   type="number" form="save"
                                                   value="${material.quantity}">
                                        </th>
                                        <th><h3>${material.cost} kr</h3></th>
                                        <th><h3>${material.price} kr</h3></th>
                                        <c:if test="${sessionScope.user.role.equals('employee')}">
                                        <th>
                                            <form action="${pageContext.request.contextPath}/fc/removefrombomlistcommand" method="post">
                                            <input type="hidden" name="materialindex" value="${index}">
                                            <input type="submit" value="Delete" class="purple-button"
                                                   style="padding: 10px 10px; width: 85px">
                                            </form>
                                        </th>

                                    </c:if>
                                </tr>
                            </c:forEach>
                        </table>
                        <table>
                            <tr class="table-labels">
                                <th class="left-text">Name</th>
                                <th class="left-text">Description</th>
                                <th class="left-text">Quantity</th>
                                <th></th>
                            </tr>
                            <tr>
                                <form action="${pageContext.request.contextPath}/fc/addtobomlistcommand" method="post">

                                    <th style="padding-right: 15px">
                                        <select class="border-input-text" type="text" name="name" >
                                            <c:forEach var="material" items="${sessionScope.allmaterials}">
                                                <option value="${material.name}">${material.name}</option>
                                            </c:forEach>
                                        </select>
                                    </th>
                                    <th style="padding-right: 15px">
                                        <select class="border-input-text" type="text" name="description">
                                            <option value="Stolper nedgraves 90 cm. i jord" selected>Stolper nedgraves 90 cm. i jord</option>
                                            <option value="Remme i sider, sadles ned i stolper">Remme i sider, sadles ned i stolper</option>
                                            <option value="Spær, monteres på rem">Spær, monteres på rem</option>
                                            <option value="Tagplader monteres på spær">Tagplader monteres på spær</option>
                                            <option value="Understernbrædder til for- & bagende">Understernbrædder til for- & bagende</option>
                                            <option value="Understernbrædder til siderne">Understernbrædder til siderne</option>
                                            <option value="Oversternbrædder til forende">Oversternbrædder til forende</option>
                                            <option value="Vandbrædder til forende">Vandbrædder til forende</option>
                                            <option value="Vandbrædder til siderne">Vandbrædder til siderne</option>
                                            <option value="løsholter til skur gavle">løsholter til skur gavle</option>
                                            <option value="løsholter til skur sider">løsholter til skur sider</option>
                                            <option value="til beklædning af skur 1 på 2">til beklædning af skur 1 på 2</option>
                                            <option value="Skruer til tagplader">Skruer til tagplader</option>
                                            <option value="Til vindkryds på spær">Til vindkryds på spær</option>
                                            <option value="Til montering af spær på rem">Til montering af spær på rem</option>
                                            <option value="Til montering af stern & vandbrædt">Til montering af stern & vandbrædt</option>
                                            <option value="Til montering af universalbeslag + hulbånd">Til montering af universalbeslag + hulbånd</option>
                                            <option value="Til montering af rem på stolper">Til montering af rem på stolper</option>
                                            <option value="til montering af yderste beklædning">til montering af yderste beklædning</option>
                                            <option value="til montering af inderste beklædning">til montering af inderste beklædning</option>
                                            <option value="Til montering af løsholter i skur">Til montering af løsholter i skur</option>
                                            <option value="til z på bagside af dør">til z på bagside af dør</option>
                                            <option value="Til lås på dør i skur">Til lås på dør i skur</option>
                                            <option value="Til skurdør">Til skurdør</option>
                                        </select>
                                    </th>
                                    <th style="padding-right: 15px">
                                        <input class="border-input-text" type="number" name="quantity" value="0">
                                    </th>
                                    <th>
                                        <input type="submit" value="Add" class="green-large-button"
                                               style="font-weight: normal; min-width: 150px; padding: 10px 24px">
                                    </th>
                                </form>
                            </tr>
                        </table>
                        <div class="col-2-grid">
                            <div style="width: 200px; padding-top: 25px">
                                <a class="red-large-button" href="${pageContext.request.contextPath}">
                                    Annuller</a>
                            </div>
                        <form id="save" action="${pageContext.request.contextPath}/fc/updateordercommand">
                            <input type="submit" value="Save" class="green-large-button"
                                   style="padding: 10px 10px; width: 85px">
                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </jsp:body>

</t:genericpage>


