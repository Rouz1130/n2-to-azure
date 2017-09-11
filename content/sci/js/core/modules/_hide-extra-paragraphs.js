(function ($) {
    
    $(function () {

	    $('.hide-extra-paragraphs').find('h3,h4,h5,h6').each(function () {

	        var $para = $(this).nextUntil('h2,h3,h4,h5,h6,div');
	      
	        if ($para.length > 1) {

	            var $showmore = $('#see-more-container').find('.see-more').clone();
	            var $showless = $showmore.clone().attr('aria-expanded', true);

	            $showmore.click(function () {
                    $(this).parent().nextUntil('h2,h3,h4,h5,h6,div').show();
	                $(this).hide();
	            });

	            $showless.click(function () {
	                $(this).parent().hide().prevUntil('h2,h3,h4,h5,h6,div').hide();
	                $showmore.show();
	            });

	            $para.first().append($showmore);
	            $para.last().append($showless);
            }
	    });


	   
	});

	

}(window.jQuery));