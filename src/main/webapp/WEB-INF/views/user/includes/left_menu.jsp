<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidebar">
    <ul id="nav">
        <li><a href="<c:url value="/user/dashboard" />" <c:if test="${page == 'dashboard'}">class="selected"</c:if>>DashBoard</a></li>
        <li><a href="#" <c:if test="${page == 'blog'}"> class="selected" </c:if>>Blog</a></li>
        <li><a href="<c:url value="/user/account" />" <c:if test="${page == 'account'}">class="selected"</c:if>>Account</a></li>
        <li><a href="<c:url value="/user/follower" />" <c:if test="${page == 'follower'}">class="selected"</c:if>>Followers</a></li>
        <li><a href="#" <c:if test="${page == 'following'}">class="selected"</c:if>>Followings</a></li>
        <li><a href="<c:url value="/logout"/>">Logout</a></li>
    </ul>
</div>