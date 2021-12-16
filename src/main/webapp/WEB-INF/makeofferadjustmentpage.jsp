<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Tilpasning af mål
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
                                    <form id="save" action="${pageContext.request.contextPath}/fc/updatecarportcommand" method="post">
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
                                <li style="width: 100%;" class="active">
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
                                <li style="width: 100%">
                                    <a href="${pageContext.request.contextPath}/fc/makeofferconfirmpage">Opret
                                        tilbud</a>
                                </li>
                            </ul>
                        </div>

                        <div class="col-md-6">
                            <div class="xhtml-string">

                                <h2>Tilpasning</h2>
                                <div style="padding-bottom: 45px">
                                    <h3>model</h3> <!--TODO: hent data fra databasen-->
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div style="margin-bottom: 15px">
                                                <input type="radio" id="flatroof" name="choosenroof" value="flatroof" checked>
                                                <label for="flatroof">Carport med fladt tag</label>
                                            </div>

                                        </div>
                                        <div class="col-xs-12">
                                            <div>
                                                <input type="radio" id="angleroof" name="choosenroof" value="angleroof">
                                                <label for="angleroof">Carport med rejsning</label>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                                <div style="padding-bottom: 45px">
                                    <h3>størrelse</h3>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div style="margin-bottom: 15px">
                                                <label for="width">Carport bredde</label>
                                                <select name="width" form="save" id="width" class="large-select-dropdown">
                                                    <option value="${sessionScope.makeoffer.carportWidth}"
                                                            selected>${sessionScope.makeoffer.carportWidth} cm
                                                    </option>
                                                    <option value="240">240 cm</option>
                                                    <option value="270">270 cm</option>
                                                    <option value="300">300 cm</option>
                                                    <option value="330">330 cm</option>
                                                    <option value="360">360 cm</option>
                                                    <option value="390">390 cm</option>
                                                    <option value="420">420 cm</option>
                                                    <option value="450">450 cm</option>
                                                    <option value="480">480 cm</option>
                                                    <option value="510">510 cm</option>
                                                    <option value="540">540 cm</option>
                                                    <option value="570">570 cm</option>
                                                    <option value="600">600 cm</option>
                                                </select>
                                            </div>
                                            <div>
                                                <label for="length">Carport længde</label>
                                                <select name="length" form="save" id="length" class="large-select-dropdown">
                                                    <option value="${sessionScope.makeoffer.carportLength}"
                                                            selected>${sessionScope.makeoffer.carportLength} cm
                                                    </option>
                                                    <option value="240">240 cm</option>
                                                    <option value="270">270 cm</option>
                                                    <option value="300">300 cm</option>
                                                    <option value="330">330 cm</option>
                                                    <option value="360">360 cm</option>
                                                    <option value="390">390 cm</option>
                                                    <option value="420">420 cm</option>
                                                    <option value="450">450 cm</option>
                                                    <option value="480">480 cm</option>
                                                    <option value="510">510 cm</option>
                                                    <option value="540">540 cm</option>
                                                    <option value="570">570 cm</option>
                                                    <option value="600">600 cm</option>
                                                    <option value="630">630 cm</option>
                                                    <option value="660">660 cm</option>
                                                    <option value="690">690 cm</option>
                                                    <option value="720">720 cm</option>
                                                    <option value="750">750 cm</option>
                                                    <option value="780">780 cm</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div style="padding-bottom: 45px">
                                    <h3>tag</h3>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div style="margin-bottom: 15px">
                                                <label for="roof">Tag-materiale</label>
                                                <select name="roof" form="save" id="roof" class="large-select-dropdown">
                                                    <option value="${sessionScope.makeoffer.roofType}"
                                                            selected>${sessionScope.makeoffer.roofType}</option>
                                                    <option value="plasttrapezplader">plasttrapezplader</option>
                                                </select>
                                            </div>
                                            <div>
                                                <label for="roofangle">Taghældning</label>
                                                <select name="roofangle" form="save" id="roofangle" class="large-select-dropdown">
                                                    <option value="${sessionScope.makeoffer.roofAngle}"
                                                            selected>${sessionScope.makeoffer.roofAngle} grader
                                                    </option>
                                                    <option value="0">0 grader</option>
                                                    <option value="15">15 grader</option>
                                                    <option value="20">20 grader</option>
                                                    <option value="25">25 grader</option>
                                                    <option value="30">30 grader</option>
                                                    <option value="35">35 grader</option>
                                                    <option value="40">40 grader</option>
                                                    <option value="45">45 grader</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div style="padding-bottom: 45px">
                                    <h3>redskabsrum</h3>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div style="margin-bottom: 15px">
                                                <label for="shedwidth">Redskabsrum bredde</label>
                                                <select name="shedwidth" form="save" id="shedwidth" class="large-select-dropdown">
                                                    <option value="${sessionScope.makeoffer.shedWidth}"
                                                            selected>${sessionScope.makeoffer.shedWidth} cm
                                                    </option>
                                                    <option value="0">Ønsker ikke redskabsrum</option>
                                                    <option value="210">210 cm</option>
                                                    <option value="240">240 cm</option>
                                                    <option value="270">270 cm</option>
                                                    <option value="300">300 cm</option>
                                                    <option value="330">330 cm</option>
                                                    <option value="360">360 cm</option>
                                                    <option value="390">390 cm</option>
                                                    <option value="420">420 cm</option>
                                                    <option value="450">450 cm</option>
                                                    <option value="480">480 cm</option>
                                                    <option value="510">510 cm</option>
                                                    <option value="540">540 cm</option>
                                                    <option value="570">570 cm</option>
                                                    <option value="600">600 cm</option>
                                                    <option value="630">630 cm</option>
                                                    <option value="660">660 cm</option>
                                                    <option value="690">690 cm</option>
                                                    <option value="720">720 cm</option>
                                                </select>
                                            </div>
                                            <div>
                                                <label for="shedlength">Redskabsrum længde</label>
                                                <select name="shedlength" form="save" id="shedlength" class="large-select-dropdown">
                                                    <option value="${sessionScope.makeoffer.shedLength}"
                                                            selected>${sessionScope.makeoffer.shedLength} cm
                                                    </option>
                                                    <option value="0">Ønsker ikke redskabsrum</option>
                                                    <option value="150">150 cm</option>
                                                    <option value="180">180 cm</option>
                                                    <option value="210">210 cm</option>
                                                    <option value="240">240 cm</option>
                                                    <option value="270">270 cm</option>
                                                    <option value="300">300 cm</option>
                                                    <option value="330">330 cm</option>
                                                    <option value="360">360 cm</option>
                                                    <option value="390">390 cm</option>
                                                    <option value="420">420 cm</option>
                                                    <option value="450">450 cm</option>
                                                    <option value="480">480 cm</option>
                                                    <option value="510">510 cm</option>
                                                    <option value="540">540 cm</option>
                                                    <option value="570">570 cm</option>
                                                    <option value="600">600 cm</option>
                                                    <option value="630">630 cm</option>
                                                    <option value="660">660 cm</option>
                                                    <option value="690">690 cm</option>
                                                </select>
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
                                        <a href="${pageContext.request.contextPath}/fc/makeofferinfopage"
                                           class="button"><i class="fa fa-chevron-left"></i> Tilbage</a>
                                    </div>
                                    <div class="col-xs-6">
                                        <a href="${pageContext.request.contextPath}/fc/makeoffermateriallistpage"
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
