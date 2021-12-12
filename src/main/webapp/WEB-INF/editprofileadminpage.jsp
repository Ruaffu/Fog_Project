<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Register as new User
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div class="grey-large-container">
            <div class="white-small-box">
                <div class="large-title-grid-element">
                    <div class="center-text">
                        <h1> Edit profile</h1>
                    </div>
                </div>
                <form action="${pageContext.request.contextPath}/fc/editusercommand" method="post">
                    <div class="row-4-grid" style="gap: 45px">
                        <div>
                            <div class="col-2-grid" style="gap: 25px">
                                <div>
                                    <label for="firstname" class="small-title-label">First name</label><br>
                                    <input class="border-input-text" type="text" id="firstname" name="firstname"
                                           value="${sessionScope.seemoreuser.firstname}"><br>
                                </div>
                                <div>
                                    <label for="lastname" class="small-title-label">Last name</label><br>
                                    <input class="border-input-text" type="text" id="lastname" name="lastname"
                                           value="${sessionScope.seemoreuser.lastname}"><br>
                                </div>
                            </div>
                        </div>
                        <div>
                            <label for="phonenr" class="small-title-label">Phone number</label><br>
                            <input class="border-input-text" type="text" id="phonenr" name="phonenr"
                                   value="${sessionScope.seemoreuser.phoneNr}"><br>
                        </div>
                        <div>
                            <div class="row-2-grid" style="gap: 20px">
                                <div class="center-flex">
                                    <div style="width: 100%; padding-right: 10px">
                                        <label for="streetname" class="small-title-label">Street</label><br>
                                        <input class="border-input-text" type="text" id="streetname" name="streetname"
                                               value="${sessionScope.seemoreuser.streetname}"><br>
                                    </div>
                                    <div>
                                        <label for="housenr" class="small-title-label">House number</label><br>
                                        <input class="border-input-text" type="text" id="housenr" name="housenr"
                                               value="${sessionScope.seemoreuser.houseNr}"><br>
                                    </div>
                                </div>
                                <div class="center-flex">
                                    <div style="width: 100%; padding-right: 10px">
                                        <label for="city" class="small-title-label">City</label><br>
                                        <input class="border-input-text" type="text" id="city" name="city"
                                               value="${sessionScope.seemoreuser.city}"><br>
                                    </div>
                                    <div>
                                        <label for="zipcode" class="small-title-label">Zip code</label><br>
                                        <input class="border-input-text" type="text" id="zipcode" name="zipcode"
                                               value="${sessionScope.seemoreuser.zipcode}"><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="padding-top: 35px">
                            <div class="col-2-grid" style="gap: 10px">
                                <a class="grey-large-button"
                                   href="${pageContext.request.contextPath}/fc/profilepage">Cancel</a>
                                <input type="hidden" name="admin" value="true">
                                <input class="green-large-button" type="submit" value="Save changes  ✓">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</t:genericpage>