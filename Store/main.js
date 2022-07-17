$(document).ready(function(){
    //  эффект зума
    let imgsItems = document.querySelectorAll('.product__preview-item img')
    let mainImg = document.querySelector('.product__preview-main')

    //Цикл по массиву
    imgsItems.forEach((item) =>{
        item.addEventListener('mouseover', function(){
            let path = item.getAttribute('src')
            mainImg.style.backgroundImage = `url(${path})`
        })
        item.addEventListener('mouseout', function() {
            mainImg.style.backgroundImage = `url('images/long_sleeve.jpg')` 
        })
    })

    // счетчик 
	$('body').on('click', '.number-minus, .number-plus', function(){
		let $row = $(this).closest('.number');
		let $input = $row.find('.number-text');
		let step = $row.data('step');
		let val = parseFloat($input.val());
		if ($(this).hasClass('number-minus')) {
			val -= step;
		} else {
			val += step;
		}
		$input.val(val);
		$input.change();
		return false;
	});

	$('body').on('change', '.number-text', function(){
		let $input = $(this);
		let $row = $input.closest('.number');
		let step = $row.data('step');
		let min = parseInt($row.data('min'));
		let max = parseInt($row.data('max'));
		let val = parseFloat($input.val());
		if (isNaN(val)) {
			val = step;
		} else if (min && val < min) {
			val = min;	
		} else if (max && val > max) {
			val = max;	
		}
		$input.val(val);
	});

    //уведомление счетчика
    $('.button__actions.button-blue').on('click', function () {
        let count = $(".number-text").val();
        $.toast({ 
            heading: 'Success',
            text: `В <a href="#">корзину</a> добавлено ${count} товара!`,
            icon: 'success',
            position:'bottom-right',
            hideAfter: 5000,
            showHideTransition: 'slide',
            allowToastClose: true
        })
        });
});
