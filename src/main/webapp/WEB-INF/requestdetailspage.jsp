<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Detaljer
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-6 introtext">
                        <div class="pageheadline setbreadcrumb">
                            <c:if test="${requestScope.request.status.equals('request')}">
                                <h1>Forespørgslser</h1>
                                <p class="split">></p>
                                <span class="active">Detaljer</span>
                            </c:if>
                            <c:if test="${requestScope.request.status.equals('offer')}">
                                <h1>Ordrer</h1>
                                <p class="split">></p>
                                <span class="active">Detaljer</span>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <section>
            <div class="container">
                <div class="row">
                    <div class="article-page">
                        <div class="col-md-9">
                            <div class="xhtml-string">
                                <c:if test="${requestScope.request.status.equals('offer')}">
                                    <h2>Tilbud</h2>
                                    <div class="row" style="margin-bottom: 20px">
                                        <div class="col-xs-12">

                                            <div>
                                                <div>
                                                    <label style="font-weight: bold">Pris: </label>
                                                </div>
                                                <div>
                                                    <p>${requestScope.request.totalPrice} kr.</p>
                                                </div>
                                            </div>

                                            <div>
                                                <div>
                                                    <label style="font-weight: bold">Antal materiale: </label>
                                                </div>
                                                <div>
                                                    <p>${requestScope.request.BOM.size()}</p>
                                                </div>
                                            </div>

                                            <div class="row"> <!--TODO: afvis et tilbud-->
                                                <div class="col-xs-6">
                                                    <a class="grey-button">
                                                        Afvis tilbud
                                                    </a>
                                                </div>
                                                <form action="${pageContext.request.contextPath}/fc/acceptoffercommand"
                                                      method="post">
                                                    <input type="hidden" name="order"
                                                           value="${requestScope.requestIndex}">
                                                    <div class="col-xs-6">
                                                        <a class="green-button">
                                                            Bekræft tilbud
                                                        </a>
                                                    </div>
                                                </form>
                                            </div>

                                        </div>

                                    </div>
                                </c:if>

                                <c:if test="${sessionScope.user.role.equals('employee')}">
                                    <h2>Kundeoplysninger</h2>
                                    <div class="alert alert-info" style="margin-bottom: 20px">
                                        <div class="row">
                                            <div class="col-xs-12">

                                                <div>
                                                    <div>
                                                        <label style="font-weight: bold">Fornavn: </label>
                                                    </div>
                                                    <div>
                                                        <p>Mie </p>
                                                    </div>
                                                </div>


                                                <div>
                                                    <div>
                                                        <label>Efternavn: </label>
                                                    </div>
                                                    <div>
                                                        <p>Thorberg </p>
                                                    </div>
                                                </div>

                                                <div>
                                                    <div>
                                                        <label>E-mail: </label>
                                                    </div>
                                                    <div>
                                                        <p>mie@mail.com</p>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div>
                                                        <label>Telefon: </label>
                                                    </div>
                                                    <div>
                                                        <p>11 22 33 44</p>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div>
                                                        <label>Adresse: </label>
                                                    </div>
                                                    <div>
                                                        <p>godnatvej nr. 15, Herlev 2730</p>
                                                    </div>
                                                </div>
                                                <div class="blue-button">
                                                    ændre profil
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <!--TODO: kunde oplysninger skal tilføjes her til-->
                                </c:if>

                                <div class="alert alert-info">
                                    <h2>Mål for carport</h2>
                                    <div style="padding-bottom: 45px">
                                        <h3>model</h3>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div>
                                                    <input type="text" value="${sessionScope.currentrequest.roofType}"
                                                           disabled> <!--TODO: carport model bliver ikke gemt :(-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="padding-bottom: 45px">
                                        <h3>størrelse</h3>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div style="margin-bottom: 15px">
                                                    <label>Carport bredde</label>
                                                    <input type="text"
                                                           value="${sessionScope.currentrequest.carportWidth} cm"
                                                           disabled>
                                                </div>
                                                <div>
                                                    <label>Carport længde</label>
                                                    <input type="text"
                                                           value="${sessionScope.currentrequest.carportLength} cm"
                                                           disabled>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="padding-bottom: 45px">
                                        <h3>tag</h3>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div style="margin-bottom: 15px">
                                                    <label>Tag-materiale</label>
                                                    <input type="text" value="${sessionScope.currentrequest.roofType}"
                                                           disabled>
                                                </div>
                                                <div>
                                                    <label>Taghældning</label>
                                                    <input type="text"
                                                           value="${sessionScope.currentrequest.roofAngle} grader"
                                                           disabled>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="padding-bottom: 45px">
                                        <h3>redskabsrum</h3>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div style="margin-bottom: 15px">
                                                    <label>Redskabsrum bredde</label>
                                                    <input type="text"
                                                           value="${sessionScope.currentrequest.shedWidth} cm" disabled>
                                                </div>
                                                <div>
                                                    <label>Redskabsrum længde</label>
                                                    <input type="text"
                                                           value="${sessionScope.currentrequest.shedLength} cm"
                                                           disabled>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="padding-bottom: 45px">
                                        <h3>Bemærkning</h3>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div style="margin-bottom: 15px">
                                                    <textarea disabled>${sessionScope.currentrequest.remarks}</textarea>
                                                </div>
                                            </div>
                                        </div>
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
