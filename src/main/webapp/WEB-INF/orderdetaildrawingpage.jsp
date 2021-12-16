<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Tegninger
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
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/orderdetailinfopage">Info</a>
                                </li>
                                <li style="width: 100%;" class="active">
                                    <a href="${pageContext.request.contextPath}/fc/orderdetaildrawingpage">Tegninger</a>
                                </li>

                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/orderdetailmateriallistpage">Stykliste</a>
                                </li>

                                <c:if test="${sessionScope.user.role.equals('employee')}">
                                    <li style="width: 100%;">
                                        <a href="${pageContext.request.contextPath}/fc/orderdetailstatuspage">Skift
                                            status</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                        <div class="col-md-9">
                            <div class="xhtml-string">
                                <h2>Tegninger</h2>
                                <div style="padding-bottom: 45px">
                                    <h3>Set fra siden</h3>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div>
                                                    ${sessionScope.svgdrawingsideview}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div style="padding-bottom: 45px">
                                    <h3>Set oppefra</h3>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div>
                                                    ${sessionScope.svgdrawing}
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
                                        <a href="${pageContext.request.contextPath}/fc/makeofferpriceadjustmentpage" class="button"><i class="fa fa-chevron-left"></i> Tilbage</a>
                                    </div>
                                    <div class="col-xs-6">
                                        <a href="${pageContext.request.contextPath}/fc/makeofferconfirmpage" class="button">Næste <i class="fa fa-chevron-right"></i></a>
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
