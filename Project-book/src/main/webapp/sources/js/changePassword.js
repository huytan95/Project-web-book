function FormValidate() {
	        var password = document.getElementById('password');
	        var confirmPassword = document.getElementById('confirmPassword');

            var errPassword = document.getElementById('errPassword');
            var errConfirmPassword = document.getElementById('errConfirmPassword');
            var regexPass = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$/;

            //check password
	        if (password.value == '' || password.value == null) {
                password.classList.add("input-error");
		        errPassword.innerHTML = "Vui lòng không để trống";
		        return false;
	          } else if(!regexPass.test(password.value)){
                password.classList.add("input-error");
		        errPassword.innerHTML = "Email không hợp lệ";
		        return false;
	        }else{
                password.classList.remove("input-error");
                errPassword.innerHTML = '';
            }
            if (confirmPassword.value == '' || confirmPassword.value == null) {
                confirmPassword.classList.add("input-error");
		        errConfirmPassword.innerHTML = "Vui lòng không để trống";
		        return false;
	          } else if(!regexPass.test(confirmPassword.value)){
                confirmPassword.classList.add("input-error");
		        errConfirmPassword.innerHTML = "Email không hợp lệ";
		        return false;
	        }else{
                confirmPassword.classList.remove("input-error");
                errConfirmPassword.innerHTML = '';
            }
         }