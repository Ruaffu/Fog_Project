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
                                    <form id="save" action="${pageContext.request.contextPath}/fc/updateorderpricecommand" method="post">
                                        <input type="submit" class="green-button" style="padding-left: 20px; padding-right: 20px" value="Gem">
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
                                                            <label style="font-weight: normal" id="calclabel1">Salgspris - kostpris = dækningsbidrag</label>

                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12" style="margin-bottom: 30px">
                                                        <div style="margin-bottom: 5px">
                                                            <label style="font-size: 18px">Dækningsgrad:</label>
                                                        </div>
                                                        <div>
                                                            <label style="font-weight: normal" id="calclabel2">Dækningsbidrag / salgspris * 100 = dækningsgrad</label>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-xs-4">
                                                        <div style="margin-bottom: 15px">
                                                            <label for="cost">Kostpris, kr.</label>
                                                            <input type="number" name="cost" id="cost" value="${sessionScope.makeoffer.totalCost}" class="white-input" disabled>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <div style="margin-bottom: 15px">
                                                            <label for="price">Salgspris, kr.</label>
                                                            <input onchange="changePrice()" type="number" name="price" id="price" form="save"
                                                                   value="${sessionScope.makeoffer.totalPrice}" class="white-input">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <div style="margin-bottom: 15px">
                                                            <label for="coverageratio">Dækningsgrad, %</label>
                                                            <input onchange="changeCoverageratio()" type="number" name="coverageratio" id="coverageratio"
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
        <script>
            changecCalcLabels();

            function changePrice() {
                var costvalue = document.getElementById("cost").value;
                var pricevalue = document.getElementById("price").value;

                //Dækningsbidrag
                var result1 = pricevalue - costvalue;
                //Dækningsgrad
                var result2 = result1/pricevalue*100;
                document.getElementById("coverageratio").value = result2.toFixed(2);
                changecCalcLabels();
            }

            function changeCoverageratio() {
                var costvalue = document.getElementById("cost").value;
                var coverageratiovalue = document.getElementById("coverageratio").value;

                var ratio = 100 - coverageratiovalue;
                //Salgspris
                var result = 100 * costvalue / ratio;

                document.getElementById("price").value = result.toFixed(2);
                changecCalcLabels();
            }


            function changecCalcLabels() {
                var costvalue = document.getElementById("cost").value;
                var pricevalue = document.getElementById("price").value;
                var coverageratiovalue = document.getElementById("coverageratio").value;

                //Dækningsbidrag
                var result1 = pricevalue - costvalue;

                document.getElementById("calclabel1").innerHTML = pricevalue + " - " + costvalue + " = " + result1 + " kr.";

                //Dækningsgrad
                document.getElementById("calclabel2").innerHTML = result1 + " / " + pricevalue + " * 100 = " + coverageratiovalue + " %";

            }

        </script>
    </jsp:body>
</t:genericpage>
