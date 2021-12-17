<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Login
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <section>
            <div class="container">
                <div class="row">
                    <div class="article-page">
                        <div class="col-md-12">
                            <div class="xhtml-string">
                                <div class="row">
                                    <div class="col-xs-3"></div>

                                    <div class="col-xs-6" style="padding-top: 50px; padding-bottom: 50px">
                                        <form name="login" action="${pageContext.request.contextPath}/fc/logincommand"
                                              method="post">
                                            <h1 style="font-weight: bold; padding-bottom: 10px">Log in</h1>

                                            <c:if test="${requestScope.error != null}">
                                                <div class="alert alert-failure" style="margin-bottom: 20px">
                                                    <label style="font-size: 16px; font-weight: bold; text-align: center">${requestScope.error}</label>
                                                </div>
                                            </c:if>
                                            <div style="margin-bottom: 20px">
                                                <label for="email" style="font-size: 16px; font-weight: bold">Indtast
                                                    e-mail</label>
                                                <input type="text" id="email" name="email" class="white-input"
                                                       placeholder="Skriv din e-mail">
                                            </div>
                                            <div style="margin-bottom: 30px">
                                                <label for="password" style="font-size: 16px; font-weight: bold">Indtast
                                                    adgangskode</label>
                                                <input type="password" id="password"
                                                       name="password" class="white-input"
                                                       placeholder="Skriv din adgangskode">
                                            </div>
                                            <div style="text-align: left">
                                                <a class="blue-link">Glemt password?</a>
                                            </div>

                                            <div style="margin-top: 30px">
                                                <input type="submit"
                                                       value="Login" class="blue-button" style="margin-bottom: 15px">
                                                <a href="${pageContext.request.contextPath}/fc/registerpage"
                                                   class="green-button">
                                                    Opret bruger
                                                </a>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-xs-3"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </jsp:body>
</t:genericpage>
