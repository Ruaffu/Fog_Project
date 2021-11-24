<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         Home
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>

        <!-- IMAGE BANNER-->
        <div class="img-container" style="background-image: url('${pageContext.request.contextPath}/images/img.png')">
            <div class="large-container">
                <div class="section">
                    <div class="white-text">
                        <div class="left-text">
                            <div class="small-title-p">
                                <c:if test="${sessionScope.user == null}">
                                    <label class="title-label">Welcome to Olsker Cupcake</label>
                                </c:if>
                                <c:if test="${sessionScope.user != null}">
                                    <label class="title-label">Welcome to ${sessionScope.user.email}</label>
                                </c:if>
                            </div>
                            <div>
                                <label class="text-label">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                    Etiam semper diam at erat
                                    pulvinar, at pulvinar felis blandit. Vestibulum volutpat tellus diam, consequat
                                    gravida libero
                                    rhoncus</label>
                            </div>
                        </div>
                    </div>
                    <div class="top-p">
                        <a class="white-small-button" href="${pageContext.request.contextPath}/fc/editorderpage"><h4>See
                            more</h4></a>
                    </div>
                </div>

            </div>
        </div>
        </div>
        </div>

        </div>


        <main>
                <%--            <c:if test="${sessionScope.role == 'employee' }">--%>
                <%--            <p style="font-size: larger">This is what you can do,--%>
                <%--                since your are logged in as an employee</p>--%>
                <%--            <p><a href="fc/employeepage">Employee Page</a>--%>
                <%--                </c:if>--%>

                <%--                <c:if test="${sessionScope.role == 'customer' }">--%>
                <%--            <p style="font-size: larger">This is what you can do, since your--%>
                <%--                are logged in as a customer</p>--%>
                <%--            <p><a href="fc/customerpage">Customer Page</a>--%>
                <%--                </c:if>--%>
        </main>
    </jsp:body>
</t:genericpage>