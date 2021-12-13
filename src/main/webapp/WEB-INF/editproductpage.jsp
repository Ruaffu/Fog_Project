<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Editing product
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div class="grey-large-container">
            <div class="white-large-box">
                <div class="large-title-grid-element">
                    <div class="center-text">
                        <h1>Add materials</h1>
                    </div>
                </div>
                <div class="row-3-grid" style="gap: 50px">
                    <div class="row-2-grid">
                        <div>
                            <table>
                                <tr class="table-labels">
                                    <th class="left-text">Name</th>
                                    <th class="left-text">Cost</th>
                                    <th class="left-text">Price</th>
                                    <th class="left-text">Length</th>
                                    <th class="left-text">Height</th>
                                    <th class="left-text">Width</th>
                                    <th class="left-text">Unit</th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <form action="${pageContext.request.contextPath}/fc/addmaterialcommand" method="post">

                                        <th style="padding-right: 15px">
                                            <input class="border-input-text" type="text" name="name" value="name">
                                        </th>
                                        <th style="padding-right: 15px">
                                            <input class="border-input-text" type="number" name="price" value="10">
                                        </th>
                                        <th style="padding-right: 15px">
                                            <input class="border-input-text" type="number" name="cost" value="10">
                                        </th>
                                        <th style="padding-right: 15px">
                                            <input class="border-input-text" type="number" name="length" value="10">
                                        </th>
                                        <th style="padding-right: 15px">
                                            <input class="border-input-text" type="number" name="height" value="10">
                                        </th>
                                        <th style="padding-right: 15px">
                                            <input class="border-input-text" type="number" name="width" value="10">
                                        </th>
                                        <th style="padding-right: 15px">
                                            <select name="unit">
                                                <option selected value="stk">stk</option>
                                                <option value="pakke">pakke</option>
                                                <option value="rulle">rulle</option>
                                            </select>
                                        </th>
                                        <th>
                                            <input type="submit" value="Add" class="green-large-button"
                                                   style="font-weight: normal; min-width: 150px; padding: 10px 24px">
                                        </th>
                                    </form>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!--
                    <div class="row-2-grid">
                        <div class="title-grid-element" style="padding-bottom: 15px">
                            <div class="left-text">
                                <h2>Change current products</h2>
                            </div>
                        </div>


                        <div>
                            <table class="collapse-table">
                                <tr class="table-labels">
                                    <th class="left-text">NAME</th>
                                    <th class="left-text">PRICE</th>
                                    <th></th>
                                </tr>
                                <c:forEach var="bottom" items="${applicationScope.bottoms}">
                                    <tr>
                                        <th style="padding-right: 15px">
                                            <input class="border-input-text" type="text" value="${bottom.name}">
                                        </th>
                                        <th style="padding-right: 15px">
                                            <input class="border-input-text" type="number" value="${bottom.price}">
                                        </th>
                                        <th>
                                            <button class="remove-button"><i class="fas fa-remove"></i></button>
                                        </th>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                    -->
                    <div style="padding-top: 35px">
                        <div class="col-2-grid" style="gap: 10px">
                            <a class="grey-large-button"
                               href="${pageContext.request.contextPath}/fc/productpage">Go back</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:genericpage>