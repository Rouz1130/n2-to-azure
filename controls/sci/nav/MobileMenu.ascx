<%@ Control Language="C#" Inherits="System.Web.UI.UserControl" %>

<nav id="nav-main-mobile">
	<ul class="nav-main-mobile-panel nav-main-mobile-panel-menu nav-main-mobile-panel-active" id="mm-0">
		<li class="nav-main-mobile-logo">
			<a href="#" class="logo">
				<img class="nav-mobile-logo-svg" src="<%= ResolveUrl("~/content/sci/img/logos/logo-red.svg") %>" />
				<img class="nav-mobile-logo-ie8" src="<%= ResolveUrl("~/content/sci/img/logos/logo-nav-ie8.png") %>" />
			</a>
		</li>
		<li><a href="#mm-1">Energy</a></li>
		<li><a href="#mm-8">Technology</a></li>
		<li><a href="#mm-16">Current issues</a></li>
		<li><a href="#mm-22">Environment</a></li>
		<li><a href="#mm-26">Community</a></li>
		<li><a href="#mm-34">Company</a></li>
	</ul>
	<ul class="nav-main-mobile-panel nav-main-mobile-panel-menu" id="mm-1">
		<li class="nav-main-mobile-back"><a href="#mm-0">Energy</a></li>
		<li><a href="#mm-2">Arctic</a><span></span></li>
		<li><a href="#mm-3">Natural gas</a><span></span></li>
		<li><a href="#mm-4">Oil</a><span></span></li>
		<li><a href="#mm-5">Oil sands</a><span></span></li>
		<li><a href="#mm-6">Outlook for Energy</a><span></span></li>
		<li><a href="#mm-7">Research and development</a><span></span></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-2">
		<li class="nav-main-mobile-back"><a href="#mm-1">Arctic</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Community of respect</a></li>
		<li><a href="#">Experience</a></li>
		<li><a href="#">Presence</a></li>
		<li><a href="#">Working in the Arctic</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-3">
		<li class="nav-main-mobile-back"><a href="#mm-1">Natural gas</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Environment and safety</a></li>
		<li><a href="#">Operations</a></li>
		<li><a href="#">Policy</a></li>
		<li><a href="#">Technology</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-4">
		<li class="nav-main-mobile-back"><a href="#mm-1">Oil</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Environment and safety</a></li>
		<li><a href="#">Policy</a></li>
		<li><a href="#">Technology</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-5">
		<li class="nav-main-mobile-back"><a href="#mm-1">Oil sands</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Canadian oil sands</a></li>
		<li><a href="#">Energy efficiency</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-6">
		<li class="nav-main-mobile-back"><a href="#mm-1">Outlook for Energy</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Why energy?</a></li>
		<li><a href="#">Global fundamentals</a></li>
		<li><a href="#">Energy demand</a></li>
		<li><a href="#">Energy supply</a></li>
		<li><a href="#">Global marketplace</a></li>
		<li><a href="#">Practical energy choices</a></li>
		<li><a href="#">Charts</a></li>
		<li><a href="#">Video</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-7">
		<li class="nav-main-mobile-back"><a href="#mm-1">Research and development</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Approach</a></li>
		<li><a href="#">Capital investments</a></li>
		<li><a href="#">Feasibility</a></li>
	</ul>
	<ul class="nav-main-mobile-panel nav-main-mobile-panel-menu" id="mm-8">
		<li class="nav-main-mobile-back"><a href="#mm-0">Technology</a></li>
		<li><a href="#mm-9">Deepwater drilling</a></li>
		<li><a href="#mm-10">Energy efficiency</a></li>
		<li><a href="#mm-11">Exploration</a></li>
		<li><a href="#mm-12">Extended reach technology</a></li>
		<li><a href="#mm-13">Hydraulic fracturing</a></li>
		<li><a href="#mm-14">Liquefied natural gas</a></li>
		<li><a href="#mm-15">Vehicle technologies</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-9">
		<li class="nav-main-mobile-back"><a href="#mm-8">Deepwater drilling</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Environment and safety</a></li>
		<li><a href="#">Technology</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-10">
		<li class="nav-main-mobile-back"><a href="#mm-8">Energy efficiency</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Carbon capture and storage</a></li>
		<li><a href="#">Cogeneration</a></li>
		<li><a href="#">Controlled freeze zone</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-11">
		<li class="nav-main-mobile-back"><a href="#mm-8">Exploration</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Remote reservoir resistivity mapping</a></li>
		<li><a href="#">Seismic mapping</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-12">
		<li class="nav-main-mobile-back"><a href="#mm-8">Extended reach technology</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Environment and safety</a></li>
		<li><a href="#">Techology</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-13">
		<li class="nav-main-mobile-back"><a href="#mm-8">Hydraulic fracturing</a></li>
		<li><a href="#">Environment and safety</a></li>
		<li><a href="#">Technology</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-14">
		<li class="nav-main-mobile-back"><a href="#mm-8">Liquefied natural gas</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Environment and safety</a></li>
		<li><a href="#">Operations</a></li>
		<li><a href="#">Policy</a></li>
		<li><a href="#">Technology</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-15">
		<li class="nav-main-mobile-back"><a href="#mm-8">Vehicle technologies</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Advanced motor oils</a></li>
		<li><a href="#">Advanced plastics</a></li>
		<li><a href="#">Hydrogen fuel cells</a></li>
	</ul>
	<ul class="nav-main-mobile-panel nav-main-mobile-panel-menu" id="mm-16">
		<li class="nav-main-mobile-back"><a href="#mm-0">Current issues</a></li>
		<li><a href="#mm-17">Accountabiliy</a></li>
		<li><a href="#mm-18">Climate policy</a></li>
		<li><a href="#mm-19">Energy policy</a></li>
		<li><a href="#mm-20">U.S. tax policy</a></li>
		<li><a href="#mm-21">Water</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-17">
		<li class="nav-main-mobile-back"><a href="#mm-16">Accountabiliy</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Conflict minerals</a></li>
		<li><a href="#">Political involvement</a></li>
		<li><a href="#">Transparency</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-18">
		<li class="nav-main-mobile-back"><a href="#mm-16">Climate policy</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Climate policy debate</a></li>
		<li><a href="#">Climate policy principles</a></li>
		<li><a href="#">Emissions reduction</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-19">
		<li class="nav-main-mobile-back"><a href="#mm-16">Energy policy</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">LNG exports</a></li>
		<li><a href="#">U.S. energy policy</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-20">
		<li class="nav-main-mobile-back"><a href="#mm-16">U.S. tax policy</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">American competitiveness</a></li>
		<li><a href="#">Current tax issues</a></li>
		<li><a href="#">U.S. tax and duty payments</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-21">
		<li class="nav-main-mobile-back"><a href="#mm-16">Water</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Fundamentals</a></li>
		<li><a href="#">Policy considerations</a></li>
		<li><a href="#">Water and energy</a></li>
		<li><a href="#">Water framework</a></li>
	</ul>
	<ul class="nav-main-mobile-panel nav-main-mobile-panel-menu" id="mm-22">
		<li class="nav-main-mobile-back"><a href="#mm-0">Environment</a></li>
		<li><a href="#mm-23">Emergency preparedness</a></li>
		<li><a href="#mm-24">Environmental performance</a></li>
		<li><a href="#mm-25">Global climate change</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-23">
		<li class="nav-main-mobile-back"><a href="#mm-22">Emergency preparedness</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Spill prevention and response</a></li>
		<li><a href="#">Tropical weather preparedness</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-24">
		<li class="nav-main-mobile-back"><a href="#mm-22">Environmental performance</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Air emissions reductions</a></li>
		<li><a href="#">Ecosystem services</a></li>
		<li><a href="#">Environmental drilling initiatives</a></li>
		<li><a href="#">Environmental stewardship</a></li>
		<li><a href="#">Freshwater management</a></li>
		<li><a href="#">Managing Arctic resources</a></li>
		<li><a href="#">Site remediation</a></li>
		<li><a href="#">Spill performance</a></li>
		<li><a href="#">Waste management</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-25">
		<li class="nav-main-mobile-back"><a href="#mm-22">Global climate change</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Climate policy</a></li>
		<li><a href="#">Improving energy efficiency</a></li>
		<li><a href="#">Managing climate change risks</a></li>
	</ul>
	<ul class="nav-main-mobile-panel nav-main-mobile-panel-menu" id="mm-26">
		<li class="nav-main-mobile-back"><a href="#mm-0">Community</a></li>
		<li><a href="#mm-27">Corporate Citizenship Report</a></li>
		<li><a href="#mm-28">Human rights</a></li>
		<li><a href="#mm-29">Local economic development</a></li>
		<li><a href="#mm-30">Malaria</a></li>
		<li><a href="#mm-31">Math and science</a></li>
		<li><a href="#mm-32">Women's economic opportunity</a></li>
		<li><a href="#mm-33">Worldwide giving</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-27">
		<li class="nav-main-mobile-back"><a href="#mm-26">Corporate Citizenship Report</a></li>
		<li><a href="#">A letter from the CEO</a></li>
		<li><a href="#">Download the full report and highlights</a></li>
		<li><a href="#">Safety, health and the workplace</a></li>
		<li><a href="#">Environmental performance</a></li>
		<li><a href="#">Economic development and supply chain management</a></li>
		<li><a href="#">Managing climate change risks</a></li>
		<li><a href="#">Human rights and managing community impacts</a></li>
		<li><a href="#">Corporate governance</a></li>
		<li><a href="#">Case studies</a></li>
		<li><a href="#">Report archive</a></li>
		<li><a href="#">Charts and data</a></li>
		<li><a href="#">External assessment</a></li>
		<li><a href="#">Global stories</a></li>
		<li><a href="#">Sustainability and engagement</a></li>
		<li><a href="#">Feedback</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-28">
		<li class="nav-main-mobile-back"><a href="#mm-26">Human rights</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Managing community impacts</a></li>
		<li><a href="#">Respecting rights</a></li>
		<li><a href="#">Security concerns</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-29">
		<li class="nav-main-mobile-back"><a href="#mm-26">Local economic development</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Our approach</a></li>
		<li><a href="#">Local hiring</a></li>
		<li><a href="#">Supplier development</a></li>
		<li><a href="#">Supply chain management</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-30">
		<li class="nav-main-mobile-back"><a href="#mm-26">Malaria</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Partners</a></li>
		<li><a href="#">Program</a></li>
		<li><a href="#">Successes</a></li>
		<li><a href="#">World Malaria Day</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-31">
		<li class="nav-main-mobile-back"><a href="#mm-26">Math and science</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Be an engineer</a></li>
		<li><a href="#">Bernard Harris Summer Science Camp</a></li>
		<li><a href="#">Change the Equation</a></li>
		<li><a href="#">Diversity and international initiatives</a></li>
		<li><a href="#">Mickelson Oltiva Teachers Academy</a></li>
		<li><a href="#">National Math and Science Initiative</a></li>
		<li><a href="#">Other programs</a></li>
		<li><a href="#">The Sally Ride Science Academy</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-32">
		<li class="nav-main-mobile-back"><a href="#mm-26">Women's economic opportunity</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">African First Ladies Summit</a></li>
		<li><a href="#">Award-winning mobile service for women entrepreneurs</a></li>
		<li><a href="#">Investing in women</a></li>
		<li><a href="#">Partners</a></li>
		<li><a href="#">Roadmap for promoting womenâ€™s economic empowerment</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-33">
		<li class="nav-main-mobile-back"><a href="#mm-26">Worldwide giving</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Employee giving</a></li>
		<li><a href="#">Oltiva Foundation</a></li>
		<li><a href="#">Giving guidelines</a></li>
		<li><a href="#">Worldwide Giving Report</a></li>
	</ul>
	<ul class="nav-main-mobile-panel nav-main-mobile-panel-menu" id="mm-34">
		<li class="nav-main-mobile-back"><a href="#mm-0">Company</a></li>
		<li><a href="#mm-35">About us</a></li>
		<li><a href="#mm-36">Careers</a></li>
		<li><a href="#mm-37">Consumer products and services</a></li>
		<li><a href="#mm-38">Contact us</a></li>
		<li><a href="#mm-39">Corporate governance</a></li>
		<li><a href="#mm-40">Multimedia</a></li>
		<li><a href="#mm-41">News and updates</a></li>
		<li><a href="#mm-42">Worldwide operations</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-35">
		<li class="nav-main-mobile-back"><a href="#mm-34">About us</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Guiding principles</a></li>
		<li><a href="#">History</a></li>
		<li><a href="#">Management</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-36">
		<li class="nav-main-mobile-back"><a href="#mm-34">Careers</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Career opportunities</a></li>
		<li><a href="#">Employment policies</a></li>
		<li><a href="#">Our employees</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-37">
		<li class="nav-main-mobile-back"><a href="#mm-34">Consumer products and services</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Customer support</a></li>
		<li><a href="#">Speedpass and credit cards</a></li>
		<li><a href="#">Station locator</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-38">
		<li class="nav-main-mobile-back"><a href="#mm-34">Contact us</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Directory</a></li>
		<li><a href="#">Email us</a></li>
		<li><a href="#">Request a speaker</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-39">
		<li class="nav-main-mobile-back"><a href="#mm-34">Corporate governance</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Additional policies and guidelines</a></li>
		<li><a href="#">Board committees</a></li>
		<li><a href="#">Board of directors</a></li>
		<li><a href="#">By-laws</a></li>
		<li><a href="#">Certificate of incorporation</a></li>
		<li><a href="#">Code of ethics and business conduct</a></li>
		<li><a href="#">Contact directors</a></li>
		<li><a href="#">Corporate officers</a></li>
		<li><a href="#">Ethics</a></li>
		<li><a href="#">Guidelines</a></li>
		<li><a href="#">Powers of the board</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-40">
		<li class="nav-main-mobile-back"><a href="#mm-34">Multimedia</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Apps</a></li>
		<li><a href="#">Publications</a></li>
		<li><a href="#">Energy lives here</a></li>
		<li><a href="#">the Lamp</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-41">
		<li class="nav-main-mobile-back"><a href="#mm-34">News and updates</a></li>
		<li><a href="#">Investors</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">News releases and alerts</a></li>
		<li><a href="#">Media contacts</a></li>
		<li><a href="#">Speeches</a></li>
	</ul>
	<ul class="nav-main-mobile-panel" id="mm-42">
		<li class="nav-main-mobile-back"><a href="#mm-34">Worldwide operations</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Brands and products</a></li>
		<li><a href="#">Business divisions</a></li>
		<li><a href="#">Safety and health</a></li>
		<li><a href="#">Locations</a></li>
	</ul>
</nav>