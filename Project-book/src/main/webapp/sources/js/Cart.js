// Lấy danh sách tất cả các nút "plus-btn" và "minus-btn"
const plusBtns = document.querySelectorAll('.qtyplus');
const minusBtns = document.querySelectorAll('.qtyminus');

// Đặt sự kiện "click" cho mỗi nút "plus-btn"
plusBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        // Lấy giá trị hiện tại của input
        const input = btn.parentElement.querySelector('input.qty');
        let value = parseInt(input.value);

        // Tăng giá trị lên 1 đơn vị
        value++;
        // Cập nhật giá trị vào input
        input.value = value;

        // Cập nhật giá trị cột thành tiền
        const unitPrice = parseFloat(btn.closest('.row').querySelector('.unit-price').textContent);
        const totalPriceElement = btn.closest('.row').querySelector('.total-price');
        const totalPrice = value * unitPrice;
        totalPriceElement.textContent = totalPrice.toFixed(2);
    });
});

// Đặt sự kiện "click" cho mỗi nút "minus-btn"
minusBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        // Lấy giá trị hiện tại của input
        const input = btn.parentElement.querySelector('input.qty');
        let value = parseInt(input.value);

        // Giảm giá trị đi 1 đơn vị, nhưng không được nhỏ hơn 1
        value = value > 1 ? value - 1 : 1;

        // Cập nhật giá trị vào input
        input.value = value;

        // Cập nhật giá trị cột thành tiền
        const unitPrice = parseFloat(btn.closest('.row').querySelector('.unit-price').textContent);
        const totalPriceElement = btn.closest('.row').querySelector('.total-price');
        const totalPrice = value * unitPrice;
        totalPriceElement.textContent = totalPrice.toFixed(2);
    });
});
