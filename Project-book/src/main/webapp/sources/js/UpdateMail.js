function FormValidate() {
		var mailType = document.getElementById('mailType').value;
	    var mailContent = document.getElementById('mailContent').value;

	    var errMailType = document.getElementById('errMailType');
	    var errMailContent = document.getElementById('errMailContent');

	    //check short mailContent
	    if (mailContent == '' || mailContent == null) {
			errMailContent.innerHTML = "Vui lòng không để trống";
	        return false;
	    }else {
			errMailContent.innerHTML = '';
		}
	    //check long mailType
	    if (mailType == '' || mailType == null) {
			errMailType.innerHTML = "Vui lòng không để trống";
	        return false;
	    }else {
			errMailType.innerHTML = '';
		}
	}