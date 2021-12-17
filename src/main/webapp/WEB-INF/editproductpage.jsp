<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Tilpas materiale sortiment
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-12 introtext">
                        <div class="pageheadline setbreadcrumb">
                            <h1>Materiale sortiment</h1>
                            <p class="split">></p>
                            <span class="active">Tilpas</span>
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
                                    <form action="${pageContext.request.contextPath}/fc/savemateriallistcommand">
                                    <input class="green-button" type="submit"
                                           style="padding-left: 20px; padding-right: 20px" value="Gem">
                                    </form>
                                </div>
                            </div>
                            <div class="col-xs-12" style="padding-bottom: 50px">
                                <h3>Tilføj nyt materiale</h3>
                                <div class="alert alert-info">
                                    <form action="${pageContext.request.contextPath}/fc/addmaterialcommand"
                                          method="post">
                                        <table style="border: none" border="0">
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <strong>Materiale</strong>
                                                    <input class="white-input" type="text" name="name" placeholder="Skriv materialenavn">
                                                </td>
                                                <td>
                                                    <strong>Kostpris</strong>
                                                    <input class="white-input" type="number" name="cost" placeholder="0,00">
                                                </td>
                                                <td>
                                                    <strong>Salgspris</strong>
                                                    <input class="white-input" type="number" name="price" placeholder="0,00">
                                                </td>
                                                <td>
                                                    <strong>Længde</strong>
                                                    <input class="white-input" type="number" name="length" placeholder="0">
                                                </td>
                                                <td>
                                                    <strong>Højde</strong>
                                                    <input class="white-input" type="number" name="height" placeholder="0">
                                                </td>
                                                <td>
                                                    <strong>Bredde</strong>
                                                    <input class="white-input" type="number" name="width" placeholder="0"
                                                           class="white-input">
                                                </td>
                                                <td>
                                                    <strong>Enhed</strong>
                                                    <select class="white-input" name="unit">
                                                        <option selected value="stk">stk</option>
                                                        <option value="pakke">pakke</option>
                                                        <option value="rulle">rulle</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <strong><br></strong>
                                                    <input type="submit" class="blue-button"
                                                           style="padding: 10px" value="Tilføj">
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                            </div>
                            <c:if test="${sessionScope.editmateriallist.size() == 0}">
                                <div class="col-xs-12">
                                    <div class="alert alert-info">
                                        <label>Ingen materialer registreret</label>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.editmateriallist.size() > 0}">
                                <div class="col-xs-12" style="margin-bottom: 50px">

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
                                        <p style="font-weight: bold">${sessionScope.editmateriallist.size()} Total</p>
                                    </div>
                                    <table class="white-background" border="0">
                                        <tbody>
                                        <tr>
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
                                            <td></td>
                                        </tr>
                                        <c:set var="index" value="-1"/>
                                        <c:forEach var="material" items="${sessionScope.editmateriallist}">
                                            <tr>
                                                <td>${material.name}</td>
                                                <td>${material.cost} kr.</td>
                                                <td>${material.price} kr.</td>
                                                <td>${material.length} cm</td>
                                                <td>${material.height} cm</td>
                                                <td>${material.width} cm</td>
                                                <td>${material.unit}</td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/fc/removefrommateriallistcommand"
                                                          method="post">
                                                        <input type="hidden" name="materialindex"
                                                               value="${index = index + 1}">
                                                        <input type="submit" value="Delete" class="red-button">

                                                    </form>

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
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </jsp:body>
</t:genericpage>