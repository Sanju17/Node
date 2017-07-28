<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content">
    <a href="<c:url value="/user/account/edit" />" class="btn btn-primary btn-sm pull-right"><span class="glyphicon glyphicon-edit"></span>&nbsp; Update Profile</span></a>
    <h3>Account</h3>
    <div class="divider">
        <div class="hr"></div>
    </div>
    <div class="box">
        <div class="box-header">
            <p>${user.firstName} ${user.lastName}</p>
        </div>

        <div class="account-info">
            <div class="pro-pic">
                <c:url value="/resources/images/profile_img.jpg" var="defaultImgUrl"/>
                <c:set value="${defaultImgUrl}" var="proPicUrl" />
                <c:if test="${user.imageUrl != null && !user.imageUrl.isEmpty()}">
                    <c:set value="${user.imageUrl}" var="proPicUrl" />
                </c:if>
                <img src="${proPicUrl}" class="img-circle" />
            </div>

            <div class="account-details">
                <table class="table table-striped">
                    <tr>
                        <th>Email:</th>
                        <td><a href="mailto:${user.email}">${user.email}</a></td>
                    </tr>
                    <tr>
                        <th>Username:</th>
                        <td>@${user.username}</td>
                    </tr>
                    <tr>
                        <th>Password:</th>
                        <td>
                            <form class="form-inline">
                                <input type="password" class="form-control" value="${user.password}" readonly="readonly"/>
                                <a href="<c:url value="/user/account/password/update" />" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span>&nbsp; Update</a>
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <th>Gender:</th>
                        <td>
                            <c:choose>
                                <c:when test="${user.gender != null && !user.gender.isEmpty()}">
                                    ${user.gender}
                                </c:when>
                                <c:otherwise>
                                    -
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>Address:</th>
                        <td>
                            <c:choose>
                                <c:when test="${user.address != null && !user.address.isEmpty()}">
                                    ${user.address}
                                </c:when>
                                <c:otherwise>
                                    -
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>About Me:</th>
                        <td>
                            <c:choose>
                                <c:when test="${user.aboutMe != null && !user.aboutMe.isEmpty()}">
                                    ${user.aboutMe}
                                </c:when>
                                <c:otherwise>
                                    -
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="clear"></div> 
        </div>
    </div>
</div>