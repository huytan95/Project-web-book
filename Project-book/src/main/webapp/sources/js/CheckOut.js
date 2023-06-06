
function FormValidate() {
    var fullName = document.getElementById('fullName').value;
    var email = document.getElementById('email').value;
    var phoneNumber = document.getElementById('phoneNumber').value;
    var address = document.getElementById('address').value;

    var errFullName = document.getElementById('errFullName');
    var errEmail = document.getElementById('errEmail');
    var errPhoneNumber = document.getElementById('errPhoneNumber');
    var errAddress = document.getElementById('errAddress');

    var regexName = /^(?!.*\s\s)[^\d+]*[\d+]{0}[^\d+]*$/;
    var regexEmail = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;
    var regesPhone = /^0[0-9]{9}$/;
    var regexPass = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$/


    //check fullName
    if (fullName == '' || fullName == null) {
        errFullName.innerHTML = "Vui lòng không để trống";
    } else if (!regexName.test(fullName)) {
        errFullName.innerHTML = "Tên không hợp lệ";
        return false;
    } else {
        errFullName.innerHTML = '';
    }
    //check email
    if (email == '' || email == null) {
        errEmail.innerHTML = "Vui lòng không để trống";
    } else if (!regexEmail.test(email)) {
        errEmail.innerHTML = "Email không hợp lệ";
        email = '';
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
    //check address
    if (address == '' || address == null) {
        errAddress.innerHTML = "Vui lòng không để trống";
        return false;
    } else {
        errAddress.innerHTML = '';
    }
    if (fullName && email && phoneNumber && address) {
        // Người dùng đã nhập đúng thông tin

        return true; //thực hiện việc submit form
    }
    return false;
}
