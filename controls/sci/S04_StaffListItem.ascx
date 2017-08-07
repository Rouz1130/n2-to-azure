
<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.ContainerControlBase" %>



<% if (Variation == 1) { %>
<style type="text/css">

a.sm-more { 
text-decoration:none; 
outline: none;

} 

</style>
<script src="../../content/vendor/jquery/jquery.min.js"></script>

	<div class="component surfaced-item surfaced-item-horizontal">
		<div class="surfaced-item-horizontal-row">
			<img class="surfaced-item-image" runat="server" src="~/content/site/placeholder.png">
			<div class="surfaced-item-copy">
				<h3><b>Mary James</b></h3>
                <span>Funeral Director, License #: FD 2738</span>
                <br><br />
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus in mollis magna. Maecenas vel vulputate urna. Vivamus vitae mattis arcu. Donec enim sapien, facilisis id cursus nec, dapibus vitae tellus. Vestibulum luctus tempus nibh vel feugiat.</p>
				<p  data-toggle="collapse" class="collapse" id="addText">Cras at lacinia elit. Aliquam pharetra ipsum ut nulla pellentesque, id porta ante lacinia. Maecenas efficitur sed enim commodo consequat. Vestibulum tristique rhoncus eros. Sed volutpat, odio id eleifend tristique, orci elit sagittis eros, sit amet convallis massa odio et elit. Praesent vel fermentum tellus.</p>
                <span><a data-toggle="collapse" data-target="#addText" class="sm-more">Show more</a></span>
			</div>
		</div>
	</div>
<script type="text/javascript">

    $(document).ready(function () {     
        var showMore = " Show more";
        var showLess = " Show less";
        $(".sm-more").click(function () {
            if ($(this).hasClass("less")) {
                $(this).removeClass("less");
                $(this).html(showMore);
            } else {
                $(this).addClass("less");
                $(this).html(showLess);
            }
            $(this).parent().prev().toggle();
            $(this).prev().toggle();
            return false;
        });
    });

</script>
<% } %>
