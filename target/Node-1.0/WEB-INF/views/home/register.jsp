<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="login-page">
    <div class="form">
        <c:url value="/register" var="registerUrl"/>
        <form action="${registerUrl}" method="post">
            <input type="text" name="firstName" placeholder="First Name" required="required"/>
            <input type="text" name="lastName" placeholder="Last Name" required="required"/>
            <input type="text" name="username" placeholder="Username" required="required"/>
            <input type="email" name="email" placeholder="Email Address" required="required"/>
            <input type="password" name="password" placeholder="Password" required="required"/>
            <input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}"/>
            <button type="submit">create</button>
            <p class="message">Already registered? <a href="<c:url value="/login"/>" >Sign In</a></p>
        </form>      
    </div>
</div>