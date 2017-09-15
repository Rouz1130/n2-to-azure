(function ($) {

    $('.language-selector').on('click', 'li', function() {
        $.ajax({
            url: $(this).parent('.language-selector').data('url'),
            type: "POST",
            dataType: "text",
            data: getData( $(this).data('lang')),
            context: this,
            success: function (data) {
                if (window.location.href != data) {
                    window.location.href = data;
                }
            }
        });
    });


}(window.jQuery));