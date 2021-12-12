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
                    <div class="black-text">
                        <div class="left-text">
                            <div class="small-title-p">
                                <c:if test="${sessionScope.user == null}">
                                    <label class="title-label">Velkommen til Johannes Fog</label>
                                </c:if>
<%--                                <c:if test="${sessionScope.user != null}">--%>
<%--                                    <label class="title-label">Welcome to ${sessionScope.user.email}</label>--%>
<%--                                </c:if>--%>
                            </div>
                            <div>
                                <label class="text-label">QUICK-BYG TILBUD
                                    Med et specialudviklet computerprogram kan vi lynhurtigt beregne prisen og udskrive en skitsetegning på en carport indenfor vores standardprogram, der tilpasses dine specifikke ønsker.

                                    Tilbud og skitsetegning fremsendes med post hurtigst muligt.
                                    Ved bestilling medfølger standardbyggevejledning.</label>
                                <div style="margin-top: 3em;margin-bottom: 3em;">
                                    <a href="${pageContext.request.contextPath}/fc/requestpage"> <img src="${pageContext.request.contextPath}/images/carport_quickbyg.jpg"></a>
                                </div>
                            </div>
                        </div>
                    </div>
<%--                    <div class="top-p">--%>
<%--                        <a class="white-small-button" href="${pageContext.request.contextPath}/fc/requestpage"><h4>See--%>
<%--                            more</h4></a>--%>
<%--                    </div>--%>
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