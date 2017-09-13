/*Popover location.detail.aspx // Facebook and Email */
$(document).ready(function () {
    $('#share-popover').popover({
        html: true,
        placement: "top",
        content: function () {
            return $('#share-popover-html').html();
        }
    });
});