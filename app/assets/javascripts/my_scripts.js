$(document).on("page:load ready", function main(){
    $('.categories-of-product .col').height($('.categories-of-product .col:first-child').width());
    /*$('.task-participate .variants .col').height($('.task-participate .variants .col:first-child').width());*/
    /*win_h = $(window).height();
    $('.contest-show').height(win_h);*/

    $('#buy-diploma').click(function(){
	    $(this).css('display', 'none');
	    $('.payment-form').css('display', 'block');
	  });

});
