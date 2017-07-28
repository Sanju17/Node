<%-- 
    Document   : classic
    Created on : Jul 14, 2017, 3:36:07 PM
    Author     : Sangharsha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value = "/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value = "/resources/css/bootstrap-theme.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet" type="text/css" />\
        <script src="<c:url value = "/resources/js/jquery.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value = "/resources/js/bootstrap.min.js" />" type="text/javascript"></script>
        <title><tiles:getAsString name="title"></tiles:getAsString></title>
        </head>
        <body>
            <div class="mainContainer">
            <tiles:insertAttribute name="header"/>
            <div class="divider">
                <div class="hr"></div>
            </div>
            <div id="toolbar">
                <div class="nav">
                    <ul>
                        <li><a href="<c:url value="/" />">Home</a></li>
                        <c:if test="${!isLoggedIn}">
                            <li><a href="<c:url value="/login"/> ">Login / Register</a></li>
                        </c:if>
                    </ul>
                </div>

                <c:if test="${isLoggedIn}">
                    <div id="profile">
                        <a href="<c:url value="/user" />"><strong>${username}</a></strong>
                    </div>
                </c:if>
                </div>

                <div id="mainContent">
                    <div id="blogPosts">
                    <tiles:insertAttribute name="body" />
                </div>
                <div id="rightSection">
                    <tiles:insertAttribute name="sidebar"/>
                </div>
            </div>
            <div id="mainFooter">
                <tiles:insertAttribute name="footer" />
            </div>
        </div>
    </body>
</html>