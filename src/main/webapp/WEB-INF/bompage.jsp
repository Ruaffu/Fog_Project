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
                                        <h3>${sessionScope.makeoffer.BOM.size()} Total</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <table class="collapse-table">
                            <tr class="table-labels">
                                <th class="left-text">PRODUCT DETAILS</th>
                                <th>QUANTITY</th>
                                <th>PRICE</th>
                                <th>TOTAL</th>
                                <c:if test="${sessionScope.user.role.equals('employee')}">
                                    <th></th>
                                </c:if>
                            </tr>
                            <c:set var="index" value="-1"></c:set>
                            <c:forEach var="material" items="${sessionScope.makeoffer.BOM}">
                                <tr>
                                    <th class="left-text">
                                        <h3>${material.name} material</h3>
                                    </th>
                                    <th><h3>${material.quantity}</h3></th>
                                    <th><h3>${material.price} kr</h3></th>
                                    <th><h3>${material.cost} kr</h3></th>
                                    <c:if test="${sessionScope.user.role.equals('employee')}">
                                        <th>
                                            <form action="${pageContext.request.contextPath}/fc/editordercommand"
                                                  method="post">

                                                <input type="hidden" name="materialid" value="${index = index + 1}">
                                                <input type="hidden" name="id" value="${sessionScope.makeoffer.id}">
                                                <input type="hidden" name="userid"
                                                       value="${sessionScope.makeoffer.user.id}">
                                                <!-- <input type="hidden" name="customerorderlist" value="false"> -->
                                                <input type="submit" value="edit" class="purple-button"
                                                       style="padding: 10px 10px; width: 85px">
                                            </form>
                                        </th>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:genericpage>


