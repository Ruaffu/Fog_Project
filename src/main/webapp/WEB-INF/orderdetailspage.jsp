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
                                <h1>Nr. ${sessionScope.editorder.id}</h1>
                                <h3><i class="fas">&#xf328;</i> Order details</h3>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="left-text">
                            <div class="title-grid-element">
                                <div class="col-3-grid">
                                    <div class="left-grid">
                                        <h2>Status</h2>
                                        <select name="status" form="save">
                                            <option value="${sessionScope.editorder.status}" selected>${sessionScope.editorder.status}</option>
                                            <option value="confirmed">confirmed</option>
                                            <option value="received">received</option>
                                            <option value="process">process</option>
                                            <option value="ready">ready</option>
                                            <option value="cancelled">cancelled</option>
                                            <option value="paid">paid</option>
                                            <option value="delivered">delivered</option>
                                        </select>
                                        <h2>Total: <h3>${sessionScope.editorder.totalPrice} kr</h3></h2>
                                        <h2>Order date: <h3>${sessionScope.editorder.orderDate}</h3></h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form action="${pageContext.request.contextPath}/fc/updatestatuscommand" method="post" id="save">
                        <input type="submit" class="green-large-button" value="Save changes ✓">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:genericpage>


