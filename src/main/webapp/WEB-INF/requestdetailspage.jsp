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
                        <div class="pageheadline">
                            <c:if test="${sessionScope.request.status.equals('request')}">
                                <h1>Forespørgsel</h1>
                            </c:if>
                            <c:if test="${sessionScope.request.status.equals('offer')}">
                                <h1>Tilbud</h1>
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
                                <c:if test="${sessionScope.request.status.equals('offer')}">
                                    <h2>Tilbud</h2>
                                    <div class="row" style="margin-bottom: 50px">
                                        <div class="col-xs-12">

                                            <div>
                                                <div>
                                                    <label style="font-weight: bold">Pris: </label>
                                                </div>
                                                <div>
                                                    <p>${sessionScope.request.totalPrice} kr.</p>
                                                </div>
                                            </div>

                                            <div>
                                                <div>
                                                    <label style="font-weight: bold">Antal materiale: </label>
                                                </div>
                                                <div>
                                                    <p>${sessionScope.request.BOM.size()}</p>
                                                </div>
                                            </div>

                                            <c:if test="${sessionScope.role.equals('customer')}">
                                                <div class="row"> <!--TODO: afvis et tilbud-->
                                                    <div class="col-xs-6">
                                                        <a class="grey-button">
                                                            Afvis tilbud
                                                        </a>
                                                    </div>
                                                    <form action="${pageContext.request.contextPath}/fc/acceptoffercommand"
                                                          method="post">
                                                        <div class="col-xs-6">
                                                            <input type="submit" class="green-button"
                                                                   value="Bekræft tilbud">
                                                        </div>
                                                    </form>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${sessionScope.user.role.equals('employee')}">
                                    <h2>Kundeoplysninger</h2>
                                    <div class="alert alert-info" style="margin-bottom: 50px">
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div>
                                                    <div>
                                                        <label style="font-weight: bold">Fornavn: </label>
                                                    </div>
                                                    <div>
                                                        <p>${sessionScope.request.user.firstname}</p>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div>
                                                        <label>Efternavn: </label>
                                                    </div>
                                                    <div>
                                                        <p>${sessionScope.request.user.lastname}</p>
                                                    </div>
                                                </div>

                                                <div>
                                                    <div>
                                                        <label>E-mail: </label>
                                                    </div>
                                                    <div>
                                                        <p>${sessionScope.request.user.email}</p>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div>
                                                        <label>Telefon: </label>
                                                    </div>
                                                    <div>
                                                        <p>${sessionScope.request.user.phoneNr}</p>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div>
                                                        <label>Adresse: </label>
                                                    </div>
                                                    <div>
                                                        <p>${sessionScope.request.user.streetname} nr. ${sessionScope.request.user.houseNr}, ${sessionScope.request.user.city} ${sessionScope.request.user.zipcode}</p>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </c:if>
                                <h2>Mål for carport</h2>
                                <div class="alert alert-info">
                                    <div style="padding-bottom: 45px">
                                        <h3>model</h3>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div>
                                                    <input type="text" value="Carport med fladt tag"
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
                                                           value="${sessionScope.request.carportWidth} cm"
                                                           disabled>
                                                </div>
                                                <div>
                                                    <label>Carport længde</label>
                                                    <input type="text"
                                                           value="${sessionScope.request.carportLength} cm"
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
                                                    <input type="text" value="${sessionScope.request.roofType}"
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
                                                           value="${sessionScope.request.shedWidth} cm" disabled>
                                                </div>
                                                <div>
                                                    <label>Redskabsrum længde</label>
                                                    <input type="text"
                                                           value="${sessionScope.request.shedLength} cm"
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
                                                    <textarea disabled>${sessionScope.request.remarks}</textarea>
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
