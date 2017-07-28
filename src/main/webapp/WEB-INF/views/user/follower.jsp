<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content">
    <h3>Followers</h3>
    <div class="divider">
        <div class="hr"></div>
    </div>
    <div class="box">
        <div class="box-header">
            Followers
        </div>

        <div class="follower-info">
            <c:choose>
                <c:when test="${user.follower.size()==0}">
                    <div class="alert alert-danger no-results-alert" role="alert"><span class="glyphicon glyphicon-warning-sign"></span>&nbsp;You have no follower.</div>
                </c:when>
                <c:otherwise>
                    <div class="card_container">
                        <c:forEach var="user_follower" items="${user.follower}">
                            <div class="card">
                                <c:url value="/resources/images/profile_img.jpg" var="defaultImgUrl"/>
                                <c:set value="${defaultImgUrl}" var="proPicUrl" />
                                <c:if test="${user_follower.imageUrl != null && !user_follower.imageUrl.isEmpty()}">
                                    <c:set value="${user_follower.imageUrl}" var="proPicUrl" />
                                </c:if>
                                <img src="${proPicUrl}" alt="John">
                                <div class="card_info_container">
                                    <h1>${user_follower.firstName} ${user_follower.lastName}</h1>
                                    <p class="title">@${user_follower.username}</p>
                                    <p>${user_follower.email}</p>
                                    <p>${user_follower.gender}</p>
                                    <p>${user_follower.address}</p>
                                    <p><a href="#" class="btn btn-danger">Unfollow</a></p>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="clear"></div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>