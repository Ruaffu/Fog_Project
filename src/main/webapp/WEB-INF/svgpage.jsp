<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         Show SVG drawing
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>
        <div class="grey-large-container">
        <div class="white-large-box">
        <div>
            <h1 class="hcarport">Carport tegning</h1>
            <div  id="svgImg">
                    ${sessionScope.svgdrawing}
            </div><br>
        <div id="bomList">
            <h2>Stykliste</h2>
            <table class="collapse-table" style="padding: 50px; margin-right: 50px; margin-top: 50px; margin-left: 50px; width: 1000px">
                <tr class="table-labels">
                    <th class="left-text">PRODUCT DETAILS</th>
                    <th class="left-text">DESCRIPTION</th>
                    <th>QUANTITY</th>
                    <th>COST</th>
                    <th>PRICE</th>
                </tr>
                <c:set var="index" value="-1"/>
                <c:forEach var="material" items="${sessionScope.order.BOM}">
                    <tr>
                        <th class="left-text">
                            <h3>${material.name}</h3>
                        </th>
                        <th class="left-text">
                            <h3>${material.description}</h3>
                        </th>

                        <th style="padding-right: 15px; width: 130px">
                            <h3>${material.quantity}</h3>
                        </th>
                        <th><h3>${material.cost} kr</h3></th>
                        <th><h3>${material.price} kr</h3></th>
                    </tr>
                </c:forEach>
            </table>
        </div>

        </div>
        </div>
        </div>

    </jsp:body>
</t:genericpage>