<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Customers
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <div class="grey-large-container">
            <div class="white-large-box">
                <div class="row-3-grid" style="gap: 20px">
                    <div class="large-title-grid-element">
                        <div class="left-text">
                            <h1>Customers</h1>
                        </div>
                    </div>
                    <div class="col-3-grid">
                        <div class="left-grid">
                            <h2>Customers</h2>
                        </div>
                        <div class="right-grid">
                            <h3>${sessionScope.users.size()} Total</h3>
                        </div>
                    </div>
                    <div>
                        <table class="collapse-table">
                            <tr class="table-labels">
                                <th class="left-text">CUSTOMER</th>
                                <th>FIRST NAME</th>
                                <th>LAST NAME</th>
                                <th>Phone</th>
                                <th>Role</th>
                                <th>Address</th>
<%--                                <th>ORDER TOTAL</th>--%>
                                <th></th>
                            </tr>
                            <c:set var="index" value="-1"/>
                            <c:forEach var="userinfo" items="${sessionScope.users}">
                            <tr>
                                <th class="left-text"><h3>${userinfo.email}</h3></th>
                                <th><h3>${userinfo.firstname}</h3></th>
                                <th><h3>${userinfo.lastname}</h3></th>
                                <th><h3>${userinfo.phoneNr}</h3></th>
                                <th><h3>${userinfo.role}</h3></th>
                                <th><h3>${userinfo.city} ${userinfo.zipcode}, ${userinfo.streetname} ${userinfo.houseNr}</h3></th>
<%--                                <th><h3>${userinfo}</h3></th>&lt;%&ndash; todo get order total &ndash;%&gt;--%>
                                <form action="${pageContext.request.contextPath}/fc/admineditusercommand" method="post">
                                    <input type="hidden" name="index" value="${index = index+1}">
                                <th><input type="submit" value="see more" class="purple-button"  style="padding: 10px 5px; width: 85px"></th>
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

