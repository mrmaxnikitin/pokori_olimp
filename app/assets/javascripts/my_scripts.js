$(document).on("page:load ready", function main(){
    $('.categories-of-product .col').height($('.categories-of-product .col:first-child').width());
    /*$('.task-participate .variants .col').height($('.task-participate .variants .col:first-child').width());*/
    /*win_h = $(window).height();
    $('.contest-show').height(win_h);*/

    $('#buy-diploma').click(function(){
	    $(this).css('display', 'none');
	    $('.payment-form').css('display', 'block');
	  });

	  $('.custEmail').change(function(){
			custEmail = $('.custEmail').val()
    	  		$('.ym_merchant_receipt').val('{\"customerContact\":\"'+custEmail+'\",\"taxSystem\": 2,\"items\": [{\"quantity\": 1,\"price\": {\"amount\": 100.00},\"tax\": 1,\"text\": \"Услуги по обработке данных\"}]}')
	 	});
	 	
	 	$('.custEmail').change(function(){
		        if($(this).val()!=''){
		            var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
		            if(pattern.test($(this).val())){
		                $('#getpay').prop('disabled', false)
		            } else {
		                ('#getpay').prop('disabled', true)
		            }
		        }else{
		            $('#getpay').prop('disabled', true)
		        }
		});

});
