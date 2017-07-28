window.onload = function () {
    validateUpdateForm();
}

function validateUpdateForm() {
    document.getElementById("submitUpdatePasswordFrm").onclick = function () {
        if (document.forms.updatePasswordForm.new_password.value !== document.forms.updatePasswordForm.confirm_password.value) {
            document.getElementById("errorMessage").innerHTML = "New Password didnot match.";
            return false;
        } else if (document.forms.updatePasswordForm.new_password.value.length < 8) {
            document.getElementById("errorMessage").innerHTML = "Password must be at least of length 8";
            return false;
        } else {
            document.getElementById("errorMessage").innerHTML = "";
            return true;
        }
    };

    document.forms.updatePasswordForm.new_password.onblur = function () {
        if (document.forms.updatePasswordForm.new_password.value.length < 8) {
            document.getElementById("errorMessage").innerHTML = "Password must be at least of length 8";
        }
    };
}