<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Skift status
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
                                <li style="width: 100%;">
                                    <a href="${pageContext.request.contextPath}/fc/orderdetaildrawingpage">Tegninger</a>
                                </li>

                                <c:if test="${sessionScope.user.role.equals('employee')}">
                                    <li style="width: 100%;" class="active">
                                        <a href="${pageContext.request.contextPath}/fc/orderdetailstatuspage">Skift
                                            status</a>
                                    </li>
                                    <li style="width: 100%;">
                                        <a href="${pageContext.request.contextPath}/fc/orderdetailmateriallistpage">Stykliste</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                        <div class="col-md-9">
                            <div class="xhtml-string">
                                <h2>Stykliste</h2>
                                <div>
                                    <div class="row">
                                        <div class="col-xs-12" style="padding-bottom: 50px">
                                            <div class="alert alert-info">
                                                <form action="${pageContext.request.contextPath}/fc/updatestatuscommand"
                                                      method="post">
                                                    <table style="border: none" border="0">
                                                        <tbody>
                                                        <tr>
                                                            <td>
                                                                <strong>status</strong>
                                                                <select type="text" name="status" class="white-input">
                                                                    <option value="${sessionScope.editorder.status}" selected>${sessionScope.editorder.status}</option>
                                                                    <option value="confirmed">confirmed</option>
                                                                    <option value="received">received</option>
                                                                    <option value="process">process</option>
                                                                    <option value="ready">ready</option>
                                                                    <option value="cancelled">cancelled</option>
                                                                    <option value="paid">paid</option>
                                                                    <option value="delivered">delivered</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <strong><br></strong>
                                                                <input type="submit" class="blue-button"
                                                                       style="padding: 10px" value="Skift">
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </form>

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
