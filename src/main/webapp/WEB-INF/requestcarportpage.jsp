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
                    <div style="box-sizing: border-box; width: 100%">
                        <form action="${pageContext.request.contextPath}/fc/requestcommand" method="post">
                            <div class="row-3-grid">
                                <div class="left-text">
                                    <div class="row-2-grid" style="padding-bottom: 25px">

                                    </div>
                                </div>

                                <div class="row-2-grid" style="gap: 20px">


                                    <div class="col-2-grid" style="gap: 20px">
                                        <div>
                                            <div>
                                                <input type="radio" id="flatroof" name="choosenroof" value="flatroof">
                                                <label for="flatroof">Carport med fladt tag</label>
                                            </div>
                                            <div>
                                                <input type="radio" id="angleroof" name="choosenroof" value="angleroof">
                                                <label for="angleroof">Carport med rejsning</label>
                                            </div>
                                            <br>
                                            <label for="width">Carport bredde</label>
                                            <select name="width" id="width">
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
                                    </div>
                                    <div class="col-2-grid" style="gap: 20px">
                                        <div>
                                            <label for="length">Carport længde</label>
                                            <select name="length" id="length">
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
                                    <div class="col-2-grid" style="gap: 20px">
                                        <div>
                                            <label for="roof">Tag</label>
                                            <select name="roof" id="roof">
                                                <option value="plasttrapezplader">plasttrapezplader</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-2-grid" style="gap: 20px">
                                        <div>
                                            <label for="roofangle">Taghældning</label>
                                            <select name="roofangle" id="roofangle">
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
                                    </div>
                                    <div class="col-2-grid" style="gap: 20px">
                                        <div>
                                            <label for="shedlength">Redskabsrum længde</label>
                                            <select name="shedlength" id="shedlength">
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
                                            <label for="misc">Evt. bemærkninger</label><br>
                                            <textarea id="misc" name="misc" rows="4" cols="50">
                                            </textarea>
                                        </div>
                                    </div>

                                </div>


                            </div>
                            <div style="padding-top: 50px">
                                <div class="row-2-grid" style="gap: 10px">
                                    <input class="purple-large-button" type="submit" value="Send forespørgsel">
                                </div>

                            </div>
                    </form>
                </div>
                <div style="width: 200px; padding-top: 25px">
                    <a class="purple-no-fill-button" href="${pageContext.request.contextPath}"><i
                            class="fas">&#xf060;</i>
                        Go back to home</a>
                </div>
            </div>
        </div>

    </jsp:body>
</t:genericpage>
