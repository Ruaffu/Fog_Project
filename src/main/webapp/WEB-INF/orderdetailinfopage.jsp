<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Info om ordren
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-6 introtext">
                        <div class="pageheadline">
                            <h1>Ordre</h1>
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
                                <li style="width: 100%;" class="active">
                                    <a href="${pageContext.request.contextPath}/fc/orderdetailinfopage">Info</a>
                                </li>
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/orderdetaildrawingpage">Tegninger</a>
                                </li>

                                <c:if test="${sessionScope.user.role.equals('employee')}">
                                    <li style="width: 100%;">
                                        <a href="${pageContext.request.contextPath}/fc/orderdetailstatuspage">Skift
                                            status</a>
                                    </li>
                                    <li style="width: 100%;">
                                        <a href="${pageContext.request.contextPath}/fc/orderdetailmateriallistpage">Stykliste</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <div class="xhtml-string">
                                <h2>Ordre</h2>
                                <div style="margin-bottom: 50px">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div style="padding-bottom: 10px">
                                                <label style="font-weight: bold">ID:</label>
                                                <label>${sessionScope.editorder.id}</label>
                                            </div>
                                            <div style="padding-bottom: 10px">
                                                <label style="font-weight: bold">Status:</label>
                                                <label>${sessionScope.editorder.status}</label>
                                            </div>
                                            <div style="padding-bottom: 10px">
                                                <label style="font-weight: bold">Total pris:</label>
                                                <label>${sessionScope.editorder.totalPrice} kr.</label>
                                            </div>
                                            <div style="padding-bottom: 10px">
                                                <label style="font-weight: bold">Antal:</label>
                                                <label>${sessionScope.editorder.BOM.size()}</label>
                                            </div>
                                            <div>
                                                <label style="font-weight: bold">Dato:</label>
                                                <label>${sessionScope.editorder.orderDate}</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${sessionScope.user.role.equals('employee')}">
                                    <h2>Kundeoplysninger</h2>
                                    <div class="alert alert-info" style="margin-bottom: 50px">
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div>
                                                    <div>
                                                        <label>Fornavn: </label>
                                                    </div>
                                                    <div>
                                                        <p>${sessionScope.editorder.user.firstname}</p>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div>
                                                        <label>Efternavn: </label>
                                                    </div>
                                                    <div>
                                                        <p>${sessionScope.editorder.user.lastname}</p>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div>
                                                        <label>E-mail: </label>
                                                    </div>
                                                    <div>
                                                        <p>${sessionScope.editorder.user.email}</p>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div>
                                                        <label>Telefon: </label>
                                                    </div>
                                                    <div>
                                                        <p>${sessionScope.editorder.user.phoneNr}</p>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div>
                                                        <label>Adresse: </label>
                                                    </div>
                                                    <div>
                                                        <p>${sessionScope.editorder.user.streetname}
                                                            nr. ${sessionScope.editorder.user.houseNr}, ${sessionScope.editorder.user.city} ${sessionScope.editorder.user.zipcode}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <h2>Carport mål</h2>
                                <div class="alert alert-info">
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
                                                           value="${sessionScope.editorder.carportWidth} cm"
                                                           disabled>
                                                </div>
                                                <div>
                                                    <label>Carport længde</label>
                                                    <input type="text"
                                                           value="${sessionScope.editorder.carportLength} cm"
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
                                                    <input type="text" value="${sessionScope.editorder.roofType}"
                                                           disabled>
                                                </div>
                                                <div>
                                                    <label>Taghældning</label>
                                                    <input type="text"
                                                           value="${sessionScope.editorder.roofAngle} grader"
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
                                                           value="${sessionScope.editorder.shedWidth} cm" disabled>
                                                </div>
                                                <div>
                                                    <label>Redskabsrum længde</label>
                                                    <input type="text"
                                                           value="${sessionScope.editorder.shedLength} cm"
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
                                                    <textarea disabled>${sessionScope.editorder.remarks}</textarea>
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
                                        <a class="button" style="color: #b5b9be; cursor: default"><i
                                                class="fa fa-chevron-left"></i> Tilbage</a>
                                    </div>
                                    <div class="col-xs-6">
                                        <a href="${pageContext.request.contextPath}/fc/makeofferadjustmentpage"
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
