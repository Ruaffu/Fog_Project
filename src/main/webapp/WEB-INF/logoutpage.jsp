<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Log ud
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-6 introtext">
                        <div class="pageheadline setbreadcrumb">
                            <h1 class="active">Min profil</h1>
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
                                    <a href="${pageContext.request.contextPath}/fc/profilepage">Mine oplysninger</a>
                                </li>
                                <li style="width: 100%;" class="active">
                                    <a href="${pageContext.request.contextPath}/fc/logoutpage">Log ud</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <div class="xhtml-string">
                                <h2>Log ud</h2>

                                <div class="row">
                                    <div class="col-xs-12">
                                        <p>Er du sikker på at du vil logge af?</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <div>
                                            <a href="${pageContext.request.contextPath}/fc/profilepage" class="grey-button">Nej</a>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div>
                                            <form action="${pageContext.request.contextPath}/fc/logoutcommand">
                                                <input class="blue-button" type="submit" value="Ja">
                                            </form>
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