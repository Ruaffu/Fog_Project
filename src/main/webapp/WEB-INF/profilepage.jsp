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
                    <div class="center-flex">
                        <i style="font-size:100px" class="fas">&#xf2bd;</i>
                    </div>
                    <div class="center-text">
                        <h1 style="font-weight: normal">${sessionScope.email}</h1>
                    </div>
                </div>
                <div class="row-6-grid" style="gap: 25px">
                    <div>
                        <label class="small-title-label">First name</label><br>
                        <label>${sessionScope.user.firstname}</label>
                    </div>
                    <div>
                        <label class="small-title-label">Last name</label><br>
                        <label>${sessionScope.user.lastname}</label>
                    </div>
                    <div>
                        <label class="small-title-label">Phone number</label><br>
                        <label>${sessionScope.user.phoneNr}</label>
                    </div>
                    <div>
                        <label class="small-title-label">Address</label><br>
                        <label>${sessionScope.user.city} ${sessionScope.user.zipcode}, ${sessionScope.user.regionName}, ${sessionScope.user.streetname} ${sessionScope.user.houseNr}</label>
                    </div>
                    <div style="padding-top: 35px">
                        <div class="col-2-grid" style="gap: 10px">
                            <a class="red-large-button"
                            href="${pageContext.request.contextPath}/fc/editprofilepage">Delete profile<i
                                style="font-size:15px; color: white; padding-left: 10px"
                                class="far">&#xf2ed;</i></a>
                            <a class="green-large-button"
                               href="${pageContext.request.contextPath}/fc/editprofilepage">Edit profile <i
                                    style="font-size:15px; color: white; padding-left: 10px"
                                    class="fas">&#xf304;</i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:genericpage>