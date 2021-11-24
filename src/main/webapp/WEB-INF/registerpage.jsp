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
                        <h1>Create account</h1>
                    </div>
                </div>
                <form action="${pageContext.request.contextPath}/fc/registercommand" method="post">
                    <div class="row-6-grid" style="gap: 45px">
                        <div>
                            <div class="col-2-grid" style="gap: 25px">
                                <div>
                                    <label for="firstname" class="small-title-label" >First name</label><br>
                                    <input class="border-input-text" type="text" id="firstname" name="firstname" placeholder="Enter your first name ..."><br>
                                </div>
                                <div>
                                    <label for="lastname" class="small-title-label">Last name</label><br>
                                    <input class="border-input-text" type="text" id="lastname" name="lastname" placeholder="Enter your first name ..."><br>
                                </div>
                            </div>
                        </div>
                        <div>
                            <label for="email" class="small-title-label">Email</label><br>
                            <input class="border-input-text" type="text" id="email" name="email" placeholder="Enter your email ..."><br>
                        </div>
                        <div>
                            <div class="row-2-grid" style="gap: 20px">
                                <div>
                                    <label for="password1" class="small-title-label">Password</label><br>
                                    <input class="border-input-text" type="password" id="password1" name="password1"
                                           placeholder="Enter your password ..."><br>
                                </div>
                                <div>
                                    <label for="password2" class="small-title-label"> Password again</label><br>
                                    <input class="border-input-text" type="password" id="password2" name="password2"
                                           placeholder="Enter your password again ..."><br>
                                </div>
                            </div>
                        </div>
                        <div>
                            <label for="phonenr" class="small-title-label">Phone number</label><br>
                            <input class="border-input-text" type="text" id="phonenr" name="phonenr" placeholder="Enter your phone number ..."><br>
                        </div>
                        <div>
                            <div class="row-2-grid" style="gap: 20px">
                                <div class="center-flex">
                                    <div style="width: 100%; padding-right: 10px">
                                        <label for="streetname" class="small-title-label">Street</label><br>
                                        <input class="border-input-text" type="text" id="streetname" name="streetname" placeholder="Enter streetname ..."><br>
                                    </div>
                                    <div>
                                        <label for="housenr" class="small-title-label">House number</label><br>
                                        <input class="border-input-text" type="text" id="housenr" name="housenr" placeholder="Enter housenumber ..."><br>
                                    </div>
                                </div>
                                <div class="center-flex">
                                    <div style="width: 100%; padding-right: 10px">
                                        <label for="city" class="small-title-label">City</label><br>
                                        <input class="border-input-text" type="text" id="city" name="city" placeholder="Enter city ..."><br>
                                    </div>
                                    <div>
                                        <label for="zipcode" class="small-title-label">Zip code</label><br>
                                        <input class="border-input-text" type="text" id="zipcode" name="zipcode" placeholder="Enter zip code ..."><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="padding-top: 35px">
                            <input class="purple-large-button" type="submit" value="Create account">
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </jsp:body>
</t:genericpage>


