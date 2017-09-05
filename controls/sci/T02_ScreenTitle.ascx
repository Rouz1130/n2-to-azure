<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

	<div class="component screen-title screen-title-full-right">
		<h1 class="screen-title-title"><ks:Content runat="server" DefaultContent="Mother's Day service" ContentKey="t02_title" /></h1>
		<ks:Content runat="server" ContentKey="t02_copy"><DefaultContent>
			<img class="screen-title-image" src="~/content/site/header-narrow.jpg" />
			<p>
				<span class="screen-title-subtitle">Mother's Day service</span><br />
				Sleep on your keyboard claw pharetra et, jump kittens run faucibus sunbathe egestas purr. Sniff nam sniff run dolor chase the red dot, et rhoncus dolor bat. Tail flick enim shed everywhere consectetur, zzz bibendum attack tail flick accumsan eat the grass sleep on your keyboard.
			</p>
			<p>
				<span class="screen-title-subtitle">Garden of Angels</span><br />
				Sleep on your keyboard claw pharetra et, jump kittens run faucibus sunbathe egestas purr. Sniff nam sniff run dolor chase the red dot, et rhoncus dolor bat. Tail flick enim shed everywhere consectetur, zzz bibendum attack tail flick accumsan eat the grass sleep on your keyboard.
			</p>
		</DefaultContent></ks:Content>
	</div>

<% } else if (Variation == 2) { %>

	<div class="component screen-title screen-title-full-left">
		<h1 class="screen-title-title"><ks:Content runat="server" DefaultContent="Mother's Day service" ContentKey="t02_title" /></h1>
		<ks:Content runat="server" ContentKey="t02_copy"><DefaultContent>
			<p>
				<img class="screen-title-image" src="~/content/site/header-narrow.jpg" />
				<span class="screen-title-subtitle">Search for an obituary by name, date of birth or death. or place of birth or death.</span><br />
				Sleep on your keyboard claw pharetra et, jump kittens run faucibus sunbathe egestas purr. Sniff nam sniff run dolor chase the red dot, et rhoncus dolor bat. Tail flick enim shed everywhere consectetur, zzz bibendum attack tail flick accumsan eat the grass sleep on your keyboard.
			</p>
			<p>
				<span class="screen-title-subtitle">Garden of Angels</span><br />
				Sleep on your keyboard claw pharetra et, jump kittens run faucibus sunbathe egestas purr. Sniff nam sniff run dolor chase the red dot, et rhoncus dolor bat. Tail flick enim shed everywhere consectetur, zzz bibendum attack tail flick accumsan eat the grass sleep on your keyboard.
			</p>
		</DefaultContent></ks:Content>
	</div>

<% } else if (Variation == 3) { %>

	<div class="component screen-title screen-title-full">
	    <div>
		    <h1 class="screen-title-title"><ks:Content runat="server" DefaultContent="Victoria Sparks" ContentKey="t02_title" /></h1>
		    <ks:Content runat="server" ContentKey="t02_copy"><DefaultContent>
			    <p class="screen-title-subtitle">Search for an obituary by name, date of birth or death. or place of birth or death.</p>
		
		    </DefaultContent></ks:Content>
        </div>
	</div>

<% } %>