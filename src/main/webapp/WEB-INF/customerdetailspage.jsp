<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Kundeoplysninger
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-6 introtext">
                        <div class="pageheadline setbreadcrumb">
                            <h1>Kundeoplysninger</h1>
                            <p class="split">></p>
                            <span class="active">Detaljer</span>
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
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-6" style="padding-bottom: 50px">
                                            <h2>Kundeoplysninger</h2>

                                            <div class="alert alert-info">
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <div>
                                                            <div>
                                                                <label style="font-weight: bold">Fornavn:</label>
                                                            </div>
                                                            <div>
                                                                <p>${sessionScope.seemoreuser.firstname}</p>
                                                            </div>
                                                        </div>


                                                        <div>
                                                            <div>
                                                                <label>Efternavn:</label>
                                                            </div>
                                                            <div>
                                                                <p>${sessionScope.seemoreuser.lastname}</p>
                                                            </div>
                                                        </div>

                                                        <div>
                                                            <div>
                                                                <label>E-mail:</label>
                                                            </div>
                                                            <div>
                                                                <p>${sessionScope.seemoreuser.email}</p>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div>
                                                                <label>Telefon:</label>
                                                            </div>
                                                            <div>
                                                                <p>${sessionScope.seemoreuser.phoneNr}</p>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div>
                                                                <label>Adresse:</label>
                                                            </div>
                                                            <div>
                                                                <p>${sessionScope.seemoreuser.streetname}
                                                                    nr. ${sessionScope.seemoreuser.houseNr}, ${sessionScope.seemoreuser.city} ${sessionScope.seemoreuser.zipcode}</p>
                                                            </div>
                                                        </div>
                                                        <a href="${pageContext.request.contextPath}/fc/editprofileadminpage"
                                                           class="blue-button">
                                                            ændre profil
                                                        </a>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-6"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12" style="padding-bottom: 50px">
                                            <h2>Forespørgsler</h2>
                                            <div class="row">
                                                <div class="col-xs-12">
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
                                                    </div>
                                                    <div class="pull-right">
                                                        <p style="font-weight: bold">${sessionScope.requestlist.size()}
                                                            Total</p>
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
                                                        <c:forEach var="request" items="${sessionScope.requestlist}">
                                                            <tr>
                                                                <td>${request.id}</td>
                                                                <td>${request.BOM.size()}</td>
                                                                <td>${request.totalPrice} kr.</td>
                                                                <td>${request.orderDate}</td>
                                                                <td>${request.status}</td>
                                                                <td>
                                                                    <c:if test="${request.status.equals('request')}">
                                                                        <form action="${pageContext.request.contextPath}/fc/makeoffercommand"
                                                                              method="post">
                                                                            <input type="hidden" name="request" value="${index = index + 1}">


                                                                            <input type="submit" class="blue-button"
                                                                                   style="background-color: #074a8a; color: #fff; border: 0px; padding: 10px; font-weight: bold;"
                                                                                   value="Lav tilbud">

                                                                        </form>
                                                                    </c:if>
                                                                    <c:if test="${request.status.equals('offer')}">
                                                                        <form action="${pageContext.request.contextPath}/fc/getrequestcommand"
                                                                              method="post">
                                                                            <input type="hidden" name="request" value="${index}">
                                                                            <input type="hidden" name="listname" value="requestlist">
                                                                            <input type="submit" class="blue-button"
                                                                                   style="background-color: #074a8a; color: #fff; border: 0px; padding: 10px; font-weight: bold;"
                                                                                   value="se mere">
                                                                        </form>
                                                                    </c:if>
                                                                </td>
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
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <h2>Ordrer</h2>
                                            <div class="row">
                                                <div class="col-xs-12">
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
                                                    </div>
                                                    <div class="pull-right">
                                                        <p style="font-weight: bold">${sessionScope.orderlist.size()}
                                                            Total</p>
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
                                                        <c:forEach var="order" items="${sessionScope.orderlist}">
                                                            <tr>
                                                                <td>${order.id}</td>
                                                                <td>${order.BOM.size()}</td>
                                                                <td>${order.totalPrice} kr.</td>
                                                                <td>${order.orderDate}</td>
                                                                <td>${order.status}</td>
                                                                <form action="${pageContext.request.contextPath}/fc/getorderdetailcommand"
                                                                      method="post">
                                                                    <td>
                                                                        <input type="hidden" name="order" value="${index = index + 1}">
                                                                        <input type="hidden" name="customerorderlist" value="true">
                                                                        <input type="submit" class="blue-button" style="background-color: #074a8a; color: #fff; border: 0px; padding: 10px; font-weight: bold;" value="se mere">
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </jsp:body>

</t:genericpage>


