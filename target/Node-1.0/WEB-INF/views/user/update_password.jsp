<div class="content">
    <h3>Update Password</h3>
    <div class="divider">
        <div class="hr"></div>
    </div>
    <div class="box">
        <div class="box-header">
            <p>Update Password</p>
        </div>
        <div class="account-info">
            <c:url var="updatePasswordUrl" value="/user/account/password/update" />
            <form id="update_password_form" name="updatePasswordForm" action="${updatePasswordUrl}" method="post">

                <div class="form-group">
                    <label>Current Password: </label>
                    <input type="password" name="current_password" class="form-control" required="required"/>
                </div>
                <div class="form-group">
                    <label>New Password: </label>
                    <input type="password" name="new_password" class="form-control" required="required"/>
                </div>
                <div class="form-group">
                    <label>Confirm New Password: </label>
                    <input type="password" name="confirm_password" class="form-control" required="required"/>
                </div>
                <p id="errorMessage"></p>
                <input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                <button class="btn btn-primary" id="submitUpdatePasswordFrm" type="submit">Update Password</button>
            </form>
        </div>
    </div>
</div>