<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="content">
    <h3>Edit Account</h3>
    <div class="divider">
        <div class="hr"></div>
    </div>
    <div class="box">
        <div class="box-header">
            <p><span class="glyphicon glyphicon-user"></span>&nbsp; Edit your profile</p>
        </div>

        <div class="account-info">
            <div class="pro-pic">
                <c:url value="/resources/images/profile_img.jpg" var="defaultImgUrl"/>
                <c:set value="${defaultImgUrl}" var="proPicUrl" />
                <c:if test="${user.imageUrl != null && !user.imageUrl.isEmpty()}">
                    <c:set value="${user.imageUrl}" var="proPicUrl" />
                </c:if>
                <img src="${proPicUrl}" class="img-circle thumbnail" />
                <input type="file" name="imageUrl" accept="image/*" id="file" class="inputfile" />
                <label for="file"><span class="glyphicon glyphicon-cloud-upload"></span>&nbsp; Upload Image</label>
            </div>
            <div class="account-details">
                <c:url var="editProfileUrl" value="/user/account/edit" />
                <form:form commandName="user" action="${editProfileUrl}" method="post">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="firstName" class="control-label col-md-2 form-label">First Name</label>
                            <div class="col-md-6">
                                <form:input id="firstName" cssClass="form-control" path="firstName" value="${user.firstName}"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label for="lastName" class="control-label col-md-2 form-label">Last Name</label>
                            <div class="col-md-6">
                                <form:input id="lastName" cssClass="form-control" path="lastName" value="${user.lastName}"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label for="userName" class="control-label col-md-2 form-label">Username</label>
                            <div class="col-md-6">
                                <form:input id="username" cssClass="form-control" path="username" readonly="true" value="${user.username}"/>
                                <p>* You cannot change your username.<p>
                            </div>
                        </div>
                        <br/>
                        <br />
                        <br />
                        <div class="form-group">
                            <label for="email" class="control-label col-md-2 form-label">Email</label>
                            <div class="col-md-6">
                                <form:input id="email" cssClass="form-control" path="email" readonly="true" value="${user.email}"/>
                                <p>* You cannot change your email.<p>
                            </div>
                        </div>
                        <br/>
                        <br />
                        <br />
                        <div class="form-group">
                            <label for="password" class="control-label col-md-2 form-label">Password</label>
                            <div class="col-md-6">
                                <form:password id="password" cssClass="form-control" path="password" value="${user.password}" readonly="true"/>
                                <a href="<c:url value="/user/account/password/update" />">Change Password</a>
                            </div>
                        </div>
                        <br/>
                        <br />
                        <br />
                        <div class="form-group">
                            <label for="gender" class="control-label col-md-2">Gender</label>
                            <div class="col-md-6">
                                <form:radiobutton id="gender" path="gender" value="Male"/> Male
                                <form:radiobutton id="gender" path="gender" value="Female" /> Female
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <label for="address" class="control-label col-md-2 form-label">Address</label>
                            <div class="col-md-6">
                                <form:input id="address" cssClass="form-control" path="address" value="${user.address}"/>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <label for="aboutme" class="control-label col-md-2 form-label">About Me</label>
                            <div class="col-md-6">
                                <form:textarea id="aboutme" cssClass="form-control" path="aboutMe" rows="4" value="${user.aboutMe}" />
                            </div>
                        </div>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <form:hidden path="id" value="${user.id}" />
                        <div class="col-md-3 col-sm-offset-7">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </div>
                </form:form>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>