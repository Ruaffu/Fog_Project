<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Ordrer
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-6 introtext">
                        <div class="pageheadline">
                            <h1>Ordrer</h1>
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
                                <p style="font-weight: bold">${sessionScope.allrequests.size()} Total</p>
                            </div>
                            <table class="white-background" border="0">
                                <tbody>
                                <tr>
                                    <td>
                                        <strong>ID</strong>
                                    </td>
                                    <td>
                                        <strong>E-mail</strong>
                                    </td>
                                    <td>
                                        <strong>Telefon</strong>
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
                                <c:forEach var="order" items="${sessionScope.allorders}">
                                    <tr>
                                        <td>${order.id}</td>
                                        <td>${order.user.email}</td>
                                        <td>${order.user.phoneNr}</td>
                                        <td>${order.BOM.size()}</td>
                                        <td>${order.totalPrice} kr.</td>
                                        <td>${order.orderDate}</td>
                                        <td>${order.status}</td>
                                        <form action="${pageContext.request.contextPath}/fc/orderdetailcommand"
                                              method="post">
                                            <td>
                                                <input type="hidden" name="order" value="${index = index + 1}">
                                                <input type="submit" class="btn" style="background-color: #074a8a; color: #fff; border: 0px; padding: 10px; font-weight: bold;" value="se mere">
                                            </td>
                                        </form>
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
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </jsp:body>
</t:genericpage>

