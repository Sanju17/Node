<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${param.error}">
    <div>
        <h1 style="color:red">Username or Password is wrong. Please check again</h1>
    </div>
</c:if>
<c:if test="${param.logout}">
    <div>
        <h1 style="color:blue">Logged out.</h1>
    </div>
</c:if>

<div class="login-page">
    
    <div class="form">
        <form class="login-form" action="<c:url value="/login"/>" method="post">
            <p class="invalid-credentials"> <c:if test="${param.auth != null && param.auth == 'failure'}">Invalid credentials</c:if></p>
            <input type="text" name="username" placeholder="username" <c:if test="${param.auth != null && param.auth == 'failure'}"> class="error"</c:if>/>
            <input type="password" name="password" placeholder="password"  <c:if test="${param.auth != null && param.auth == 'failure'}"> class="error"</c:if>/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit">login</button>
            <p class="message">Not registered? <a href="<c:url value="/register"/>">Create an account</a></p>
        </form>
    </div>
</div>