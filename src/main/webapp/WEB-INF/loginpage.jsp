<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Login page
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <div class="grey-large-container">
            <div class="white-small-box">
                <div class="row-3-grid" style="gap: 20px">
                    <div class="large-title-grid-element">
                        <div class="center-text">
                            <h1>Log in</h1>
                        </div>
                    </div>
                    <form name="login" action="${pageContext.request.contextPath}/fc/logincommand"
                          method="post">
                        <div>
                            <div class="row-2-grid">
                                <div style="padding-bottom: 55px">
                                    <label class="l-label" for="email">ENTER EMAIL</label><br>
                                    <input class="border-bottom-input-text" type="text" id="email" name="email"
                                           placeholder="Email.."><br>
                                </div>
                                <div style="padding-bottom: 20px">
                                    <label class="l-label" for="password">ENTER PASSWORD</label><br>
                                    <input class="border-bottom-input-text" type="password" id="password"
                                           name="password"
                                           placeholder="Password.."><br>
                                    <div class="center-flex" style="padding: 35px 0 50px 0">
                                        <a class="blue-link">Forgot password?</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <input class="purple-large-button" type="submit"
                                   value="Login"><br>
                            <a class="green-large-button" href="${pageContext.request.contextPath}/fc/registerpage">Create account</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:genericpage>
