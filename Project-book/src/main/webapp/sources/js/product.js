function FormValidate() {
		var productName = document.getElementById('productName').value;
	    var categories = document.getElementById('categories').value;
	    var priceInput = document.getElementById('priceInput').value;
	    var priceOutput = document.getElementById('priceOutput').value;
	    var shortDescription = document.getElementById('shortDescription').value;
	    var longDescription = document.getElementById('longDescription').value;
	    var discound = document.getElementById('discound').value;
	    var quantity = document.getElementById('quantity').value;

	    var errProductName = document.getElementById('errProductName');
	    var errCategories = document.getElementById('errCategories');
	    var errPriceInput = document.getElementById('errPriceInput');
	    var errPriceOutput = document.getElementById('errPriceOutput');
	    var errShortDescription = document.getElementById('errShortDescription');
	    var errLongDescription = document.getElementById('errLongDescription');
	    var errDiscound = document.getElementById('errDiscound');
	    var errQuantity = document.getElementById('errQuantity');

	    const regexProductName = /^(?!.*  )[^\n]+$/;

	    //check product name
	    if (productName == '' || productName == null) {
			errProductName.innerHTML = "Vui lòng không để trống";
	        return false;
		} else if (!regexProductName.test(productName)) {
			errProductName.innerHTML = "Tên không hợp lệ";
			return false;
		} else {
			errProductName.innerHTML = '';
		}
	    // check categories 
	    if (categories == '' || categories == null) {
			errCategories.innerHTML = "Vui lòng chọn danh mục sản phẩm";
	        return false;
	    }else {
			errCategories.innerHTML = '';
		}
	    //check originalPrice
	    if (priceInput == '' || priceInput == null) {
	    	errPriceInput.innerHTML = "Vui lòng không để trống";
	        return false;
	    }else if(priceInput<=0){
	    	errPriceInput.innerHTML = "Giá bán phải lớn hơn 0 đồng!";
	        return false;
	    }{
	    	errPriceInput.innerHTML = '';
		}
	    // check salePrice
	    if (priceOutput == '' || priceOutput == null) {
	    	errPriceOutput.innerHTML = "Vui lòng không để trống";
	        return false;
	    }else if(priceOutput <= 0){
	    	errPriceOutput.innerHTML = "Giá bán phải lớn hơn 0 đồng!";
	        return false;
	    }{
	    	errPriceOutput.innerHTML = '';
		}
	 // check discound
	    if (discound < 0) {
	    	errDiscound.innerHTML = "Giá trị phải lớn hơn 0 đồng!";
	        return false;
	    }else {
	    	errDiscound.innerHTML = '';
		}
	 // check quantity
	    if (quantity == '' || quantity == null) {
	    	errQuantity.innerHTML = "Vui lòng không để trống";
	        return false;
	    }else if(quantity<=0){
	    	errQuantity.innerHTML = "Giá bán phải lớn hơn 0 đồng!";
	        return false;
	    }{
	    	errQuantity.innerHTML = '';
		}
	    //check short Description
	    if (shortDescription == '' || shortDescription == null) {
			errShortDescription.innerHTML = "Vui lòng không để trống";
	        return false;
	    }else {
			errShortDescription.innerHTML = '';
		}
	    //check long Desscription
	    if (longDescription == '' || longDescription == null) {
			errLongDescription.innerHTML = "Vui lòng không để trống";
	        return false;
	    }else {
			errLongDescription.innerHTML = '';
		}
	    //everything ok
	    if (productName && categories && priceInput && priceOutput && discound && shortDescription && longDescription) {
	        // Người dùng đã nhập đúng thông tin
	        alert("Lưu thành công");
	        return true; //thực hiện việc submit form
	    }
	}