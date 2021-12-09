<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Customer details
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <div class="grey-large-container">
            <div class="white-large-box">
                <div class="row-3-grid" style="gap: 10px">
                    <div class="large-title-grid-element">
                        <div class="left-text">
                            <h1><i class="fas">&#xf2bd;</i> ${sessionScope.seemoreuser.email}</h1>
                            <h3>Customer details</h3>
                        </div>
                    </div>
                    <div>
                        <div class="left-text">
                            <div class="title-grid-element" style="display: inline">
                                <h2>Details <a class="red-button"
                                               href="${pageContext.request.contextPath}/fc/editprofileadminpage"><i
                                        class="fas fa-edit"></i></a></h2>

                            </div>
                        </div>
                        <div class="center-flex"
                             style="background-color: #E5E0EA; padding: 20px; margin: 5px; border-radius: 20px">
                            <div class="row-5-grid" style="gap: 25px">
                                <div>
                                    <label class="small-title-label">First name</label><br>
                                    <label>${sessionScope.seemoreuser.firstname}</label>
                                </div>
                                <div>
                                    <label class="small-title-label">Last name</label><br>
                                    <label>${sessionScope.seemoreuser.lastname}</label>
                                </div>
                                <div>
                                    <label class="small-title-label">Phone number</label><br>
                                    <label>${sessionScope.seemoreuser.phoneNr}</label>
                                </div>
                                <div>
                                    <label class="small-title-label">City</label><br>
                                    <label>${sessionScope.seemoreuser.city} ${sessionScope.seemoreuser.zipcode}</label>
                                </div>
                                <div>
                                    <label class="small-title-label">Address</label><br>
                                    <label>${sessionScope.seemoreuser.streetname} ${sessionScope.seemoreuser.houseNr}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="left-text">
                            <div class="title-grid-element">
                                <div class="col-3-grid">
                                    <div class="left-grid">
                                        <h2>Orders</h2>
                                    </div>
                                    <div class="right-grid">
                                        <h3>${sessionScope.orderlist.size()} Total</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <table class="collapse-table">
                            <tr class="table-labels">
                                <th class="left-text">ORDER</th>
                                <th>ITEMS</th>
                                <th>TOTAL</th>
                                <th>DATE</th>
                                <th>STATUS</th>
                                <th></th>
                            </tr>
                            <c:set var="index" value="-1"></c:set>
                            <c:forEach var="order" items="${sessionScope.orderlist}">
                                <tr>
                                    <th class="left-text"><h3>${order.id}</h3></th>
                                    <th><h3>${order.totalItems}</h3></th>
                                    <th><h3>${order.totalPrice} kr</h3></th>
                                    <th><h3>${order.orderDate}</h3></th>
                                    <th><h3>${order.status}</h3></th>
                                    <form action="${pageContext.request.contextPath}/fc/orderdetailcommand" method="post">
                                        <input type="hidden" name="order" value="${index = index + 1}">
                                        <input type="hidden" name="customerorderlist" value="true">
                                        <th><input type="submit" value="See more" class="purple-button"
                                                   style="padding: 10px 10px; ; width: 85px"></th>
                                    </form>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:genericpage>


