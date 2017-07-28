<%-- 
    Document   : classic
    Created on : Jul 14, 2017, 3:36:07 PM
    Author     : Sangharsha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value = "/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value = "/resources/css/bootstrap-theme.min.css"/>" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/dashboard.css'/>" />
        <script src="<c:url value = "/resources/js/jquery.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value = "/resources/js/bootstrap.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/js/dashboard.js"/>" type="text/javascript"></script>
        <title><tiles:getAsString name="title"></tiles:getAsString></title>
        </head>
        <body>
            <div class="mainContainer">
            <c:set var="page" scope="request"><tiles:getAsString name="pageName"></tiles:getAsString></c:set>
            <tiles:insertAttribute name="header"/>

            <div id="container">
                <tiles:insertAttribute name="left_menu"/>
                <tiles:insertAttribute name="content" />
            </div>
            <div id="mainFooter">
                <%--<tiles:insertAttribute name="footer" />--%>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                var height1 = $('.content').height();
                var height2 = $('body').height();

                if (height1 > height2) {
                    $('.sidebar').height(height1);
                } else {
                    $('.sidebar').height(height2);
                }
            });
        </script>
    </body>
</html>