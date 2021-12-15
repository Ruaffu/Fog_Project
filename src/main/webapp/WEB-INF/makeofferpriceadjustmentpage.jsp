<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Prissætning
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
                                    <input type="submit" class="green-button" style="padding-left: 20px; padding-right: 20px" value="Gem"> <!--TODO: gem-->
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 article-page-menu mobile-navigation">
                            <ul class="nav nav-pills nav-stacked" style="padding-bottom: 20px">
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferinfopage">Info</a>
                                </li>
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferadjustmentpage"> Tilpasning af mål</a>
                                </li>
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/makeoffermateriallistpage">Stykliste</a>
                                </li>
                                <li style="width: 100%;" class="active">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferpriceadjustmentpage">Prissætning</a>
                                </li>
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferdrawingpage">Tegninger</a>
                                </li>
                                <li style="width: 100%">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferconfirmpage">Opret tilbud</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-9">
                            <div class="xhtml-string">
                                <h2>Prissætning</h2>
                                <div style="padding-bottom: 45px">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="alert alert-info">
                                                <div class="row">
                                                    <div class="col-xs-12" style="margin-bottom: 30px">
                                                        <div style="margin-bottom: 5px">
                                                            <label style="font-size: 18px">Dækningsbidrag:</label>
                                                        </div>
                                                        <div>
                                                            <label style="font-weight: normal">20 - 10 = 10 kr.</label> <!--TODO: javascript til at opdater-->
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12" style="margin-bottom: 30px">
                                                        <div style="margin-bottom: 5px">
                                                            <label style="font-size: 18px">Dækningsgrad:</label>
                                                        </div>
                                                        <div>
                                                            <label style="font-weight: normal">10 / 20 * 100 = 10 %</label> <!--TODO: javascript til at opdater-->
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-xs-4">
                                                        <div style="margin-bottom: 15px">
                                                            <label for="cost">Kostpris, kr.</label>
                                                            <input type="number" name="cost" id="cost" value="${sessionScope.makeoffer.totalCost}" class="white-input">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <div style="margin-bottom: 15px">
                                                            <label for="price">Salgspris, kr.</label>
                                                            <input type="number" name="price" id="price"
                                                                   value="${sessionScope.makeoffer.totalPrice}" class="white-input">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <div style="margin-bottom: 15px">
                                                            <label for="coverageratio">Dækningsgrad, %</label>
                                                            <input type="number" name="coverageratio" id="coverageratio"
                                                                   value="${sessionScope.makeoffer.coverageRatio}" class="white-input">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="row">
                                <div class="pull-right col-xs-3">

                                    <div class="col-xs-6">
                                        <a href="${pageContext.request.contextPath}/fc/makeoffermateriallistpage" class="button"><i class="fa fa-chevron-left"></i> Tilbage</a>
                                    </div>
                                    <div class="col-xs-6">
                                        <a href="${pageContext.request.contextPath}/fc/makeofferdrawingpage" class="button">Næste <i class="fa fa-chevron-right"></i></a>
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
