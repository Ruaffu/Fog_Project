<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
        Lav carport
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-6 introtext">
                        <div class="pageheadline">
                            <h1>Lav carport</h1>
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
                            <form action="${pageContext.request.contextPath}/fc/requestcommand" method="post">
                                <c:if test="${sessionScope.failure != null}">
                                    <div style="padding-bottom: 20px">

                                        <div class="alert alert-info" style="background-color: lightcoral">
                                            <label style="color: red; font-weight: bold">${sessionScope.failure}</label>
                                        </div>
                                    </div>
                                </c:if>

                                <div style="padding-bottom: 45px">
                                    <h3>Vælg model</h3>
                                    <div class="row">

                                        <div class="col-xs-12">
                                            <div style="margin-bottom: 15px">
                                                <input type="radio" id="flatroof" name="choosenroof" value="flatroof">
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
                                    <h3>Vælg størrelse</h3>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <div style="margin-bottom: 15px">
                                                <label for="width">Carport bredde</label>
                                                <select name="width" id="width"  class="large-select-dropdown">
                                                    <option value="initial">Vælg bredde</option>
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
                                                <select name="length" id="length" class="large-select-dropdown">
                                                    <option value="initial">Vælg længde</option>
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
                                    <h3>Vælg tag</h3>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <div style="margin-bottom: 15px">
                                                <label for="roof">Tag-materiale</label>
                                                <select name="roof" id="roof" class="large-select-dropdown">
                                                    <option value="initial">Vælg tag</option>
                                                    <option value="plasttrapezplader">plasttrapezplader</option>
                                                </select>
                                            </div>
                                            <div>
                                                <label for="roofangle">Taghældning</label>
                                                <select name="roofangle" id="roofangle" class="large-select-dropdown">
                                                    <option value="initial">Vælg hældning</option>
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
                                    <h3>Vælg redskabsrum</h3>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <div style="margin-bottom: 15px">
                                                <label for="shedwidth">Redskabsrum bredde</label>
                                                <select name="shedwidth" id="shedwidth" class="large-select-dropdown">
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
                                                </select>
                                            </div>
                                            <div>
                                                <label for="shedlength">Redskabsrum længde</label>
                                                <select name="shedlength" id="shedlength" class="large-select-dropdown">
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
                                <div style="padding-bottom: 70px">
                                    <h3>Andet</h3>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <div style="margin-bottom: 15px">
                                                <label for="misc">Evt. bemærkninger</label>
                                                <textarea id="misc" name="misc" placeholder="Skriv her"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <a href="${pageContext.request.contextPath}" class="grey-button"> Fortryd </a>
                                        </div>
                                        <div class="col-xs-3">
                                            <input class="blue-button" type="submit" value="Send forespørgsel">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </jsp:body>
</t:genericpage>
