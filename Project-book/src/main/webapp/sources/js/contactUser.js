function FormValidate() {
            var name = document.getElementById('name').value;
            var email = document.getElementById('email').value;
            var phoneNumber = document.getElementById('phoneNumber').value;
            var message = document.getElementById('messageValue').value;

            var errName = document.getElementById('errName');
            var errEmail = document.getElementById('errEmail');
            var errPhoneNumber = document.getElementById('errPhoneNumber');
            var errMessage = document.getElementById('errMessage');

            var regexName = /^(?!.*\s\s)[^\d+]*[\d+]{0}[^\d+]*$/;
            var regexEmail = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;
            var regexPhone = /^0[0-9]{9}$/;



            //check Name
            if (name == '' || name == null) {
                errName.innerHTML = "Vui lòng không để trống";
            } else if (!regexName.test(name)) {
                errName.innerHTML = "Tên không hợp lệ";
                return false;
            } else {
                errName.innerHTML = '';
            }
            //check email
            if (email == '' || email == null) {
                errEmail.innerHTML = "Vui lòng không để trống";
                return false;
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
                return false;
            } else if (!regexPhone.test(phoneNumber)) {
                errPhoneNumber.innerHTML = "Số điện thoại không hợp lệ";
                return false;
            } else {
                errPhoneNumber.innerHTML = '';
            }
            //check message
            if (message == '' || message == null) {
                    errMessage.innerHTML = "Vui lòng không để trống";
                    return false;
                } else {
                    errMessage.innerHTML = '';
                }
        }