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
                                <c:if test="${sessionScope.user.role.equals('employee')}">
                                    <th></th>
                                </c:if>
                            </tr>
                            <c:set var="index" value="-1"></c:set>
                            <c:forEach var="material" items="${sessionScope.bomlist}">
                                <tr>
                                    <th class="left-text">
                                        <h3>${material.name}</h3>
                                    </th>
                                    <th class="left-text">
                                        <h3>${material.description}</h3>
                                    </th>
                                    <th style="padding-right: 15px; width: 130px">
                                        <input name="quantity" id="quantity" class="border-input-text" type="number"
                                               value="${material.quantity}" onchange="changeQuantity()">
<%--                                        <input type="hidden" value="${material.quantity = requestScope.}">--%>
                                    </th>
                                    <th><h3>${material.cost} kr</h3></th>
                                    <th><h3>${material.price} kr</h3></th>
                                    <c:if test="${sessionScope.user.role.equals('employee')}">
                                        <th>
                                            <form action="${pageContext.request.contextPath}/fc/removefrombomlistcommand"
                                                  method="post">

                                                <input type="hidden" name="materialindex" value="${index = index + 1}">
<%--                                                <input type="hidden" name="id" value="${sessionScope.bomlist.id}">--%>
                                                <input type="submit" value="Delete" class="purple-button"
                                                       style="padding: 10px 10px; width: 85px">
                                            </form>
                                        </th>
                                    </c:if>
                                </tr>
                                <script>
                                    function changeQuantity() {
                                        ${material.quantity} = document.getElementById("quantity").value;

                                    }
                                </script>
                            </c:forEach>
                        </table>
                        <form action="${pageContext.request.contextPath}/fc/updateordercommand">
                        <input type="submit" value="Save" class="purple-button"
                               style="padding: 10px 10px; width: 85px">
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </jsp:body>

</t:genericpage>


