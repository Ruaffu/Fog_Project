<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Info om ordren
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-6 introtext">
                        <div class="pageheadline">
                            <h1>Ordre</h1>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <section>
            <div class="container">
                <div class="row">
                    <div class="article-page">
                        <div class="col-md-3 article-page-menu mobile-navigation">
                            <ul class="nav nav-pills nav-stacked" style="padding-bottom: 20px">
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/orderdetailinfopage">Info</a>
                                </li>
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/orderdetaildrawingpage">Tegninger</a>
                                </li>

                                <li style="width: 100%;" class="active">
                                    <a href="${pageContext.request.contextPath}/fc/orderdetailmateriallistpage">Stykliste</a>
                                </li>

                                <c:if test="${sessionScope.user.role.equals('employee')}">
                                    <li style="width: 100%;">
                                        <a href="${pageContext.request.contextPath}/fc/orderdetailstatuspage">Skift
                                            status</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                        <div class="col-md-9">
                            <div class="xhtml-string">
                                <h2>Stykliste</h2>
                                <div>
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
                                            </div> <!--TODO: lav funktion til at juster antallet i tabellen-->
                                            <div class="pull-right">
                                                <p style="font-weight: bold">${sessionScope.editorder.BOM.size()}
                                                    Total</p>
                                            </div>
                                            <table class="white-background" border="0">
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <strong>ID</strong>
                                                    </td>
                                                    <td>
                                                        <strong>Materiale</strong>
                                                    </td>
                                                    <td>
                                                        <strong>Beskrivelse</strong>
                                                    </td>
                                                    <td>
                                                        <strong>Antal</strong>
                                                    </td>
                                                    <td>
                                                        <strong>Kostpris</strong>
                                                    </td>
                                                    <td>
                                                        <strong>Salgspris</strong>
                                                    </td>
                                                </tr>
                                                <c:set var="index" value="-1"/>
                                                <c:forEach var="material" items="${sessionScope.editorder.BOM}">
                                                    <tr>
                                                        <td>${material.id}</td>
                                                        <td>${material.name}</td>
                                                        <td>${material.description}</td>
                                                        <td>${material.quantity}</td>
                                                        <td>${material.cost} kr.</td>
                                                        <td>${material.price} kr.</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="row">
                                <div class="pull-right col-xs-3">

                                    <div class="col-xs-6">
                                        <a href="${pageContext.request.contextPath}/fc/orderdetaildrawingpage"
                                           class="button"><i class="fa fa-chevron-left"></i> Tilbage</a>
                                    </div>
                                    <div class="col-xs-6">
                                        <c:if test="${sessionScope.user.role.equals('customer')}">
                                            <a class="button" style="color: #b5b9be; cursor: default">Næste <i class="fa fa-chevron-right"></i></a>
                                        </c:if>
                                        <c:if test="${sessionScope.user.role.equals('employee')}">
                                            <a href="${pageContext.request.contextPath}/fc/orderdetailstatuspage"
                                               class="button">Næste <i class="fa fa-chevron-right"></i></a>
                                        </c:if>

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
