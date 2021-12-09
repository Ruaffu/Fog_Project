<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Find us
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div class="grey-large-container">
            <div class="large-box" style="padding: 0">
                <div class="col-2-grid" style="box-sizing: border-box; gap: 20px; width: 100%">
                    <div style="box-sizing: border-box; width: 100%; padding: 50px; background-color: white">
                        <div class="large-title-grid-element">
                            <div class="left-text">
                                <h1>Find us</h1>
                            </div>
                        </div>
                        <div class="row-2-grid" style="gap: 10px">
                            <div class="row-3-grid" style="gap: 10px">
                                <div>
                                    <h3 style="font-weight: normal"><i style="color: #7A15C7" class="fa">&#xf0e0;</i>
                                        Email: info@johannesfog.dk </h3>
                                </div>
                                <div>
                                    <h3 style="font-weight: normal"><i style="color: #7A15C7" class="fas">&#xf879;</i>
                                        Phone: 45 87 10 01 </h3>
                                </div>
                                <div>
                                    <h3 style="font-weight: normal"><i style="color: #7A15C7" class="fas">&#xf041;</i>
                                        Address: Firskovvej 20, 2800 Lyngby</h3>
                                </div>
                            </div>
                            <div>
                                <img src="${pageContext.request.contextPath}/images/kort.png"
                                     style="position: relative; box-sizing: border-box; height: auto; max-width: 600px; width: 100%; display: block">
                            </div>
                        </div>
                        <div style="width: 200px; padding-top: 25px">
                            <a class="purple-no-fill-button" href="${pageContext.request.contextPath}"><i
                                    class="fas">&#xf060;</i>
                                Go back to home</a>
                        </div>
                    </div>
                    <div style="box-sizing: border-box; background-color: #3C1460; padding: 50px">
                        <div class="white-text">
                            <div class="large-title-grid-element" style="padding-top: 20px">
                                <div class="center-text">
                                    <h1>Get in touch</h1>
                                </div>
                            </div>

                            <div class="row-2-grid" style="gap: 20px">
                                <div class="row-3-grid" style="gap: 10px">
                                    <div>
                                        <label style="padding-bottom: 5px" for="messagename">Name</label><br>
                                        <input class="border-input-text" type="text" id="messagename" name="messagename"
                                               placeholder="Write your name.."><br>
                                    </div>
                                    <div>
                                        <label style="padding-bottom: 5px" for="messageemail">Email</label><br>
                                        <input class="border-input-text" type="text" id="messageemail"
                                               name="messaageemail"
                                               placeholder="Write your email.."><br>
                                    </div>
                                    <div>
                                        <label style="padding-bottom: 5px" for="message-textarea">Message</label><br>
                                        <textarea class="border-input-text" id="message-textarea"
                                                  name="messaage-textarea" style="min-height: 200px"
                                                  placeholder="Write your message.."></textarea><br>
                                    </div>
                                </div>
                                <div style="padding-top: 20px">
                                    <input class="green-large-button" type="submit" value="Send message">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:genericpage>
