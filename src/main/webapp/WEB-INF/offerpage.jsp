<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Forespørgelser
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-6 introtext">
                        <div class="pageheadline">
                            <h1>Forespørgsler</h1>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="xhtml-string">
                            <div class="col-xs-12">
                                <div class="row">
                                    <c:if test="${sessionScope.customerrequests.size() == 0}">
                                        <div class="alert alert-info">
                                            <label>Du har ingen registrede forespørgsler</label>
                                        </div>
                                    </c:if>
                                    <c:if test="${sessionScope.customerrequests.size() > 0}">
                                        <div class="clearfix  search-pagination">
                                            <select class="pull-left search-dropdown">
                                                <option>Vis 10</option>
                                                <option>Vis 25</option>
                                                <option>Vis 50</option>
                                            </select>
                                            <ul class="pull-right pagination-sm pagination">
                                                <li>
                                                    <a class="fa fa-chevron-left"></a>
                                                </li>
                                                <li class="pagination-page active">
                                                    <a>1</a>
                                                </li>
                                                <li>
                                                    <a class="fa fa-chevron-right"></a>
                                                </li>
                                            </ul>
                                        </div> <!--TODO: lav funktion til at juster antallet i tabellen-->
                                        <div class="pull-right">
                                            <p style="font-weight: bold">${sessionScope.customerrequests.size()} Total</p>
                                        </div>
                                        <table class="white-background" border="0">
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <strong>ID</strong>
                                                </td>
                                                <td>
                                                    <strong>Antal</strong>
                                                </td>
                                                <td>
                                                    <strong>Total</strong>
                                                </td>
                                                <td>
                                                    <strong>Dato</strong>
                                                </td>
                                                <td>
                                                    <strong>Status</strong>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <c:set var="index" value="-1"></c:set>
                                            <c:forEach var="request" items="${sessionScope.customerrequests}">

                                                <tr>
                                                    <td>${request.id}</td>
                                                    <td>${request.BOM.size()}</td>
                                                    <td>${request.totalPrice} kr.</td>
                                                    <td>${request.orderDate}</td>
                                                    <td>${request.status}</td>
                                                    <td>

                                                        <c:if test="${request.status.equals('request')}">
                                                            <form action="${pageContext.request.contextPath}/fc/getrequestcommand"
                                                                  method="post">
                                                                <input type="hidden" name="request" value="${index = index + 1}">
                                                                <input type="hidden" name="listname" value="customerrequests">
                                                                <input type="submit" class="blue-button"
                                                                       style="background-color: #074a8a; color: #fff; border: 0px; padding: 10px; font-weight: bold;"
                                                                       value="see mere">
                                                            </form>
                                                        </c:if>
                                                        <c:if test="${request.status.equals('offer')}">
                                                            <form action="${pageContext.request.contextPath}/fc/getrequestcommand"
                                                                  method="post">
                                                                <input type="hidden" name="request" value="${index = index + 1}">
                                                                <input type="hidden" name="listname" value="customerrequests">
                                                                <input type="submit" class="green-button"
                                                                       style="border: 0px; padding: 10px; font-weight: bold;"
                                                                       value="Se tilbud">
                                                            </form>
                                                        </c:if>
                                                        <c:if test="${request.status.equals('rejected')}">
                                                            <form action="${pageContext.request.contextPath}/fc/getrequestcommand"
                                                                  method="post">
                                                                <input type="hidden" name="request" value="${index = index + 1}">
                                                                <input type="hidden" name="listname" value="customerrequests">
                                                                <input type="submit" class="blue-button"
                                                                       style="background-color: #074a8a; color: #fff; border: 0px; padding: 10px; font-weight: bold;"
                                                                       value="see mere">
                                                            </form>
                                                        </c:if>

                                                    </td>

                                                    <!--TODO: delete button-->
                                                </tr>
                                            </c:forEach>

                                            </tbody>
                                        </table>
                                        <div class="clearfix  search-pagination">
                                            <ul class="pull-right pagination-sm pagination">
                                                <li>
                                                    <a class="fa fa-chevron-left"></a>
                                                </li>
                                                <li class="pagination-page active">
                                                    <a>1</a>
                                                </li>
                                                <li>
                                                    <a class="fa fa-chevron-right"></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </c:if>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </jsp:body>

</t:genericpage>

