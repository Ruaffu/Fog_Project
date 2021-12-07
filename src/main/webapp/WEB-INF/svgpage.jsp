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

        <div>
            <h2>Drawing</h2>

            <p>Here we insert a drawing</p>

<%--            <svg width="255" height=210>--%>
<%--                <rect x="0" y="0" height="90" width="90"--%>
<%--                      style="stroke:#000000; fill: #ff0000"></rect>--%>
<%--                <rect x="120" y="0" height="90" width="135"--%>
<%--                      style="stroke:#000000; fill: #ff0000"></rect>--%>
<%--                <rect x="0" y="120" height="90" width="90"--%>
<%--                      style="stroke:#000000; fill: #ff0000"></rect>--%>
<%--                <rect x="120" y="120" height="90" width="135"--%>
<%--                      style="stroke:#000000; fill: #ff0000"></rect>--%>
<%--            </svg>--%>

            <div id="svgImg">

                ${sessionScope.svgdrawing}

            </div>


        </div>

    </jsp:body>
</t:genericpage>