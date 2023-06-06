function FormValidate() {
		var oldPassword = document.getElementById('oldPassword').value;
		var password = document.getElementById('password').value;
		var confirmPassword = document.getElementById('confirmPassword').value;

		var errOldPassword = document.getElementById('errOldPassword');
		var errPassword = document.getElementById('errPassword');
		var errConfirmPassword = document.getElementById('errConfirmPassword');

		var regexPass = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$/;


		//check password
		if (oldPassword == '' || oldPassword == null) {
			errOldPassword.innerHTML = "Vui lòng không để trống";
				return false;
		} else {
			errOldPassword.innerHTML = '';

		}

		//check new password
		if (password == '' || password == null) {
			errPassword.innerHTML = "Vui lòng không để trống";
				return false;
		} else if (!regexPass.test(password)) {
			errPassword.innerHTML = "Mật khẩu phải tối thiểu 8 ký tự, bao gồm số, chữ hoa và ký tự đặc biệt!";
			password = '';
            return false;
		} else {
			errPassword.innerHTML = '';
		}
		//check match password
		if (confirmPassword == '' || confirmPassword == null) {
			errConfirmPassword.innerHTML = "Vui lòng không để trống!";
				return false;
			}else if(password != confirmPassword){
				errConfirmPassword.innerHTML = "Mật khẩu không trùng khớp";
				return false;
			}else{
				errConfirmPassword.innerHTML = "";
			}
	}