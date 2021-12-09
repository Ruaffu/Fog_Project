<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Find us
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div class="grey-large-container">
            <div class="white-large-box" style="width: 70%">
                <div class="title-grid-element">
                    <div class="center-text">
                        <h1>Carport</h1>
                    </div>
                </div>
                <div class="col-2-grid" style="box-sizing: border-box; gap: 50px; width: 100%">
                    <form action="${pageContext.request.contextPath}/fc/sendoffercommand" method="post">
                        <div class="row-3-grid">
                            <div class="left-text">
                                <div class="row-2-grid" style="padding-bottom: 25px">

                                </div>
                            </div>

                            <div class="row-2-grid" style="gap: 20px">


                                <div class="col-2-grid" style="gap: 20px">
                                    <div>
                                        <br>
                                        <label for="width">Carport bredde</label>
                                        <select name="width" id="width">
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
                                </div>
                                <div class="col-2-grid" style="gap: 20px">
                                    <div>
                                        <label for="length">Carport længde</label>
                                        <select name="length" id="length">
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
                                <div class="col-2-grid" style="gap: 20px">
                                    <div>
                                        <label for="roof">Tag</label>
                                        <select name="roof" id="roof">
                                            <option value="${sessionScope.makeoffer.roofType}"
                                                    selected>${sessionScope.makeoffer.roofType}</option>
                                            <option value="plasttrapezplader">plasttrapezplader</option>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-2-grid" style="gap: 20px">
                                    <div>
                                        <label for="roofangle">Taghældning</label>
                                        <select name="roofangle" id="roofangle">
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
                                <br>

                                <p>Redskabsrum</p>
                                <div class="col-2-grid" style="gap: 20px">
                                    <div>
                                        <label for="shedwidth">Redskabsrum bredde</label>
                                        <select name="shedwidth" id="shedwidth">
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
                                </div>
                                <div class="col-2-grid" style="gap: 20px">
                                    <div>
                                        <label for="shedlength">Redskabsrum længde</label>
                                        <select name="shedlength" id="shedlength">
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
                                <div class="col-2-grid" style="gap: 20px">

                                    <div>
                                        <label for="misc">Evt. bemærkninger</label><br> <%--todo: fix textbox--%>
                                        <textarea id="misc" name="misc" rows="4" cols="50">
                                            </textarea>
                                    </div>
                                </div>
                                <div>
                                    <input type="text" name="price" value="${sessionScope.makeoffer.totalPrice} Salgspris">
                                    <input type="text" name="cost" value="${sessionScope.makeoffer.totalCost} Kostpris">
                                    <input type="text" name="coverageratio"
                                           value="${sessionScope.makeoffer.coverageRatio} Ba %"> <%--todo: update in realtime aka javascript--%>
                                </div>

                            </div>


                        </div>
                        <div style="width: 200px; padding-top: 25px">
                            <a class="purple-no-fill-button" href="${pageContext.request.contextPath}/fc/bomcopycommand">
                                Stykliste</a>
                        </div>
                </div>
                <div style="padding-top: 50px">
                    <div class="row-2-grid" style="gap: 10px">
                        <input class="purple-large-button" type="submit" value="Lav Tilbud">
                    </div>

                </div>

                </form>

                <div style="width: 200px; padding-top: 25px">
                    <a class="purple-no-fill-button" href="${pageContext.request.contextPath}"><i
                            class="fas">&#xf060;</i>
                        Go back to home</a>
                </div>
            </div>

        </div>
        </div>

    </jsp:body>
</t:genericpage>
