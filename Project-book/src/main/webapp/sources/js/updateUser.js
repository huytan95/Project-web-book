function FormValidate() {
		var userName = document.getElementById('userName').value;
	    var fullName = document.getElementById('fullName').value;
	    var birthday = document.getElementById('birthday').value;
	    var address = document.getElementById('address').value;
	    var email = document.getElementById('email').value;
	    var phoneNumber = document.getElementById('phoneNumber').value;

	    var errUserName = document.getElementById('errUserName');
	    var errFullName = document.getElementById('errFullName');
	    var errBirthday = document.getElementById('errBirthday');
	    var errAddress = document.getElementById('errAddress');
	    var errEmail = document.getElementById('errEmail');
	    var errPhoneNumber = document.getElementById('errPhoneNumber');

	    var regexUserName = /^[a-zA-Z0-9_]+$/;
	    var regexName = /^(?!.*\s\s)[^\d+]*[\d+]{0}[^\d+]*$/;
		var regexEmail = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;
		var regesPhone = /^0[0-9]{9}$/;

	    //check fullName
		if (fullName == '' || fullName == null) {
			errFullName.innerHTML = "Vui lòng không để trống";
		} else if (!regexName.test(fullName)) {
			errFullName.innerHTML = "Tên không hợp lệ";
			return false;
		} else {
			errFullName.innerHTML = '';
		}
		//check userName
		if (userName == '' || userName == null) {
			errUserName.innerHTML = "Vui lòng không để trống";
		} else if (!regexUserName.test(userName)) {
			errUserName.innerHTML = "Tên không hợp lệ";
			return false;
		} else {
			errUserName.innerHTML = '';
		}
		//check email
		if (email == '' || email == null) {
			errEmail.innerHTML = "Vui lòng không để trống";
		} else if (!regexEmail.test(email)) {
			errEmail.innerHTML = "Email không hợp lệ";
			email = '';
			return false;
		} else {
			errEmail.innerHTML = '';
		}
		//check phone number
		if (phoneNumber == '' || phoneNumber == null) {
			errPhoneNumber.innerHTML = "Vui lòng không để trống";
		} else if (!regesPhone.test(phoneNumber)) {
			errPhoneNumber.innerHTML = "Số điện thoại không hợp lệ";
			email = '';
			return false;
		} else {
			errPhoneNumber.innerHTML = '';
		}
		//check birthday
		 if (birthday == '' || birthday == null) {
			errBirthday.innerHTML = "Vui lòng không để trống";
			return false;
		} else {
			errBirthday.innerHTML = '';
		}
		 //check address
		 if (address == '' || address == null) {
			errAddress.innerHTML = "Vui lòng không để trống";
			return false;
		} else {
			errAddress.innerHTML = '';
		}
	}