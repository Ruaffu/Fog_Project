<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Materialer
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-6 introtext">
                        <div class="pageheadline">
                            <h1>Materiale sortiment</h1>
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
                            <div class="col-xs-12" style="margin-bottom: 20px">
                                <div class="pull-right">
                                    <a href="${pageContext.request.contextPath}/fc/editmateriallistcommand"
                                       class="blue-button"
                                       style="padding-left: 20px; padding-right: 20px">Tilpas</a>
                                </div>
                            </div>
                            <c:if test="${sessionScope.materials.size() == 0}">
                                <div class="col-xs-12">
                                    <div class="alert alert-info">
                                        <label>Ingen materialer registreret</label>
                                    </div>
                                </div>

                            </c:if>
                            <c:if test="${sessionScope.materials.size() > 0}">
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
                                        <p style="font-weight: bold">${sessionScope.materials.size()} Total</p>
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
                                                <strong>Kostpris</strong>
                                            </td>
                                            <td>
                                                <strong>Salgspris</strong>
                                            </td>
                                            <td>
                                                <strong>Længde</strong>
                                            </td>
                                            <td>
                                                <strong>Højde</strong>
                                            </td>
                                            <td>
                                                <strong>Bredde</strong>
                                            </td>
                                            <td>
                                                <strong>Enhed</strong>
                                            </td>
                                        </tr>
                                        <c:forEach var="material" items="${sessionScope.materials}">
                                            <tr>
                                                <td>${material.id}</td>
                                                <td>${material.name}</td>
                                                <td>${material.cost} kr.</td>
                                                <td>${material.price} kr.</td>
                                                <td>${material.length} cm</td>
                                                <td>${material.height} cm</td>
                                                <td>${material.width} cm</td>
                                                <td>${material.unit}</td>
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
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </jsp:body>
</t:genericpage>
