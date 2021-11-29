<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Find us
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div class="grey-large-container">
            <div class="white-large-box" style="width: 70%">
                <div class="title-grid-element">
                    <div class="center-text">
                        <h1>Carport</h1>
                    </div>
                </div>
                <div class="col-2-grid" style="box-sizing: border-box; gap: 50px; width: 100%">
                    <div style="box-sizing: border-box; width: 100%">

                        <table class="table table-striped">

<%--                            <c:forEach var="bmiEntry" items="${requestScope.bmiEntryList}">--%>
                                <tr>
                                    <th>Carport bredde</th>
                                    <td>yo</td>
                                </tr>
                            <tr>
                                <th>Carport længde</th>
                                <td>300 cm</td>
                            </tr>
                            <tr>
                                <th>Tag</th>
                                <td>Plasttrapezplader</td>
                            </tr>
                            <tr>
                                <th>Taghældning</th>
                                <td>0 grader</td>
                            </tr>
                            <tr>
                                <th>Redskabsrum bredde</th>
                                <td>210 cm</td>
                            </tr>
                            <tr>
                                <th>Redskabsrum længde</th>
                                <td>150 cm</td>
                            </tr>

<%--                            </c:forEach>--%>
                        </table>



               <p>Din forespørgelse er blevet sendt....Good luck!</p>
                        <div style="width: 200px; padding-top: 25px">
                            <a class="purple-large-button" href="${pageContext.request.contextPath}"><i
                                    class="fas">&#xf060;</i>
                                Go back to home</a>
                        </div>
            </div>
        </div>

    </jsp:body>
</t:genericpage>
