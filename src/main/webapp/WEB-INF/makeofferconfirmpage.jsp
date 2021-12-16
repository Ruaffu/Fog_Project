<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Opret tilbud
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
                        <div class="col-md-3 article-page-menu mobile-navigation">
                            <ul class="nav nav-pills nav-stacked" style="padding-bottom: 20px">
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferinfopage">Info</a>
                                </li>
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferadjustmentpage"> Tilpasning
                                        af mål</a>
                                </li>
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/makeoffermateriallistpage">Stykliste</a>
                                </li>
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferpriceadjustmentpage">Prissætning</a>
                                </li>
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferdrawingpage">Tegninger</a>
                                </li>
                                <li style="width: 100%" class="active">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferconfirmpage">Opret
                                        tilbud</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <div class="xhtml-string">
                                <h2>Opret tilbud</h2>
                                <div style="padding-bottom: 45px">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="small-text" style="margin-bottom: 20px">
                                                <p>ID: ${sessionScope.makeoffer.id}</p>
                                                <p>Model: Carport med flat tag</p> <!--TODO: hent data fra database-->
                                                <p>Bredde: ${sessionScope.makeoffer.carportWidth} cm</p>
                                                <p>Længde: ${sessionScope.makeoffer.carportLength} cm</p>
                                                <p>Tag-materiale: ${sessionScope.makeoffer.roofType}</p>
                                                <p>Taghældning: ${sessionScope.makeoffer.roofAngle} grader</p>
                                                <p>Redskabsrum bredde: ${sessionScope.makeoffer.shedWidth} cm</p>
                                                <p>Redskabsrum længde: ${sessionScope.makeoffer.shedLength}</p>
                                                <p>Antal: ${sessionScope.makeoffer.BOM.size()}</p>
                                                <p>Total pris: ${sessionScope.makeoffer.totalPrice} kr.</p>
                                                <br>
                                                <p>Kunde-ID: ${sessionScope.makeoffer.user.id}</p>
                                                <p>E-mail: ${sessionScope.makeoffer.user.email}</p>
                                                <p>Telefon: ${sessionScope.makeoffer.user.phoneNr}</p>
                                                <br>
                                                <p>Dato: ${sessionScope.makeoffer.orderDate}</p>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div style="padding-bottom: 20px">
                                                <form action="${pageContext.request.contextPath}/fc/saveoffercommand" method="post">
                                                    <input type="submit" class="blue-button" value="Opret tilbud">
                                                </form>
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
                                        <div class="button"><a class="fa fa-chevron-left"></a> Tilbage</div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="button" style="color: #b5b9be; cursor: default">Næste <a
                                                class="fa fa-chevron-right"></a></div>
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
