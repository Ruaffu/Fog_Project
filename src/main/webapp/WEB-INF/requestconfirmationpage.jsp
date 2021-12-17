<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Forespørgsel modtaget
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="xhtml-string">
                            <div class="row">
                                <div class="pull-right col-xs-3">
                                    <div class="col-xs-12">
                                        <a href="${pageContext.request.contextPath}/fc/index"
                                           class="button">Gå til forsiden <i class="fa fa-chevron-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <h2 style="padding-top: 50px">Din forespørgsel er modtaget</h2>
                                <div style="box-sizing: border-box; width: 100%">
                                    <p>Følgende information er sendt med din forespørgsel:</p>
                                    <table class="table table-striped">
                                        <tr>
                                            <th>Carport bredde</th>
                                            <td>${requestScope.width} cm</td>
                                        </tr>
                                        <tr>
                                            <th>Carport længde</th>
                                            <td>${requestScope.length} cm</td>
                                        </tr>
                                        <tr>
                                            <th>Tag</th>
                                            <td>${requestScope.roof}</td>
                                        </tr>
                                        <tr>
                                            <th>Taghældning</th>
                                            <td>${requestScope.roofangle} grader</td>
                                        </tr>
                                        <tr>
                                            <th>Redskabsrum bredde</th>
                                            <td>${requestScope.shedwidth} cm</td>
                                        </tr>
                                        <tr>
                                            <th>Redskabsrum længde</th>
                                            <td>${requestScope.shedlength} cm</td>
                                        </tr>
                                        <tr>
                                            <th>Bemærkning</th>
                                            <td>${requestScope.remarks}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </jsp:body>
</t:genericpage>
