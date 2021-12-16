<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Stykliste
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-6 introtext">
                        <div class="pageheadline setbreadcrumb">
                            <h1>Forespørgslser</h1>
                            <p class="split">></p>
                            <span class="active">Lav tilbud</span>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <section>
            <div class="container">
                <div class="row">
                    <div class="article-page">
                        <div class="col-md-12">
                            <div class="col-xs-12">
                                <div class="pull-right">
                                    <form id="save" action="${pageContext.request.contextPath}/fc/updateordercommand">
                                        <input type="submit" class="green-button"
                                               style="padding-left: 20px; padding-right: 20px" value="Gem">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 article-page-menu mobile-navigation">
                            <ul class="nav nav-pills nav-stacked" style="padding-bottom: 20px">
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferinfopage">Info</a>
                                </li>
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferadjustmentpage"> Tilpasning
                                        af mål</a>
                                </li>
                                <li style="width: 100%;" class="active">
                                    <a href="${pageContext.request.contextPath}/fc/makeoffermateriallistpage">Stykliste</a>
                                </li>
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferpriceadjustmentpage">Prissætning</a>
                                </li>
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferdrawingpage">Tegninger</a>
                                </li>

                                <li style="width: 100%">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferconfirmpage">Opret
                                        tilbud</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-9">
                            <div class="xhtml-string">
                                <h2>Stykliste</h2>
                                <div>
                                    <div class="row">
                                        <div class="col-xs-12" style="padding-bottom: 50px">
                                            <h3>Tilføj nyt materiale</h3>
                                            <div class="alert alert-info">
                                                <form action="${pageContext.request.contextPath}/fc/addtobomlistcommand"
                                                      method="post">
                                                    <table style="border: none" border="0">
                                                        <tbody>
                                                        <tr>
                                                            <td>
                                                                <strong>Materiale</strong>
                                                                <select type="text" name="name" class="white-input">
                                                                    <c:forEach var="material"
                                                                               items="${sessionScope.allmaterials}">
                                                                        <option value="${material.name}">${material.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <strong>Beskrivelse</strong>
                                                                <select type="text" name="description"
                                                                        class="white-input">
                                                                    <option value="Stolper nedgraves 90 cm. i jord"
                                                                            selected>Stolper nedgraves 90 cm. i jord
                                                                    </option>
                                                                    <option value="Remme i sider, sadles ned i stolper">
                                                                        Remme i sider, sadles ned i stolper
                                                                    </option>
                                                                    <option value="Spær, monteres på rem">Spær, monteres
                                                                        på rem
                                                                    </option>
                                                                    <option value="Tagplader monteres på spær">Tagplader
                                                                        monteres på spær
                                                                    </option>
                                                                    <option value="Understernbrædder til for- & bagende">
                                                                        Understernbrædder til for- & bagende
                                                                    </option>
                                                                    <option value="Understernbrædder til siderne">
                                                                        Understernbrædder til siderne
                                                                    </option>
                                                                    <option value="Oversternbrædder til forende">
                                                                        Oversternbrædder til forende
                                                                    </option>
                                                                    <option value="Vandbrædder til forende">Vandbrædder
                                                                        til forende
                                                                    </option>
                                                                    <option value="Vandbrædder til siderne">Vandbrædder
                                                                        til siderne
                                                                    </option>
                                                                    <option value="løsholter til skur gavle">løsholter
                                                                        til skur gavle
                                                                    </option>
                                                                    <option value="løsholter til skur sider">løsholter
                                                                        til skur sider
                                                                    </option>
                                                                    <option value="til beklædning af skur 1 på 2">til
                                                                        beklædning af skur 1 på 2
                                                                    </option>
                                                                    <option value="Skruer til tagplader">Skruer til
                                                                        tagplader
                                                                    </option>
                                                                    <option value="Til vindkryds på spær">Til vindkryds
                                                                        på spær
                                                                    </option>
                                                                    <option value="Til montering af spær på rem">Til
                                                                        montering af spær på rem
                                                                    </option>
                                                                    <option value="Til montering af stern & vandbrædt">
                                                                        Til montering af stern & vandbrædt
                                                                    </option>
                                                                    <option value="Til montering af universalbeslag + hulbånd">
                                                                        Til montering af universalbeslag + hulbånd
                                                                    </option>
                                                                    <option value="Til montering af rem på stolper">Til
                                                                        montering af rem på stolper
                                                                    </option>
                                                                    <option value="til montering af yderste beklædning">
                                                                        til montering af yderste beklædning
                                                                    </option>
                                                                    <option value="til montering af inderste beklædning">
                                                                        til montering af inderste beklædning
                                                                    </option>
                                                                    <option value="Til montering af løsholter i skur">
                                                                        Til montering af løsholter i skur
                                                                    </option>
                                                                    <option value="til z på bagside af dør">til z på
                                                                        bagside af dør
                                                                    </option>
                                                                    <option value="Til lås på dør i skur">Til lås på dør
                                                                        i skur
                                                                    </option>
                                                                    <option value="Til skurdør">Til skurdør</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <strong>Antal</strong>
                                                                <input type="number" name="quantity" value="0"
                                                                       class="white-input">
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
                                                <p style="font-weight: bold">${sessionScope.makeoffer.BOM.size()}
                                                    Total</p>
                                            </div>
                                            <table class="white-background" border="0">
                                                <tbody>
                                                <tr>
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
                                                    <td></td>
                                                </tr>
                                                <c:set var="index" value="-1"/>
                                                <c:forEach var="material" items="${sessionScope.bomlist}">
                                                    <tr>
                                                        <td>${material.name}</td>
                                                        <td>${material.description}</td>
                                                        <td>
                                                            <input name="quantity${index = index + 1}"
                                                                   class="white-input"
                                                                   type="number" form="save"
                                                                   value="${material.quantity}">
                                                        </td>
                                                        <td>${material.cost} kr.</td>
                                                        <td>${material.price} kr.</td>
                                                        <td>
                                                            <form action="${pageContext.request.contextPath}/fc/removefrombomlistcommand"
                                                                  method="post">
                                                                <input type="hidden" name="materialindex"
                                                                       value="${index}">
                                                                <input type="submit" value="Delete" class="red-button">
                                                            </form>
                                                        </td>
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
                                        <a href="${pageContext.request.contextPath}/fc/makeofferadjustmentpage"
                                           class="button"><i class="fa fa-chevron-left"></i> Tilbage</a>
                                    </div>
                                    <div class="col-xs-6">
                                        <a href="${pageContext.request.contextPath}/fc/makeofferpriceadjustmentpage"
                                           class="button">Næste <i class="fa fa-chevron-right"></i></a>
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
