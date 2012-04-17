<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>$Title - Iowa City Book Festival</title>
	<meta name="description" content="The Iowa City Book Festival brings authors to Iowa City for three days to celebrate books, writing, and reading.">
	<meta name="author" content="Iowa City Book Festival">

	<meta name="viewport" content="width=device-width">

	<% require themedCSS(layout) %>
	<% base_tag %>
	<script src="{$ThemeDir}/js/libs/modernizr-2.5.3-respond-1.1.0.min.js"></script>
	
</head>
<body>

	<div id="top-bar">
		<div id="top-date">
		<span class="date">July 13-15, 2012<!--2012--></span> <span class="location">• UI Pentacrest </span><span class="sponsor">Presented by <a href="http://www.lib.uiowa.edu/" target="_blank">The University of Iowa Libraries</a></span>
		<div class="clear"></div>
		</div><!--/end date -->
	</div>
	<div class="pattern"></div>
	<div id="header-container">
		<header class="wrapper clearfix">
			<h1 id="title"><a href="$BaseHref"><img src="{$ThemeDir}/images/logo.png"></img></a></h1>
			<nav>
			
				<ul>
				<% control Menu(1) %>
					<li><a href="$Link">$MenuTitle</a></li>
				<% end_control %>
				</ul>
			</nav>

		</header>

	</div>

	<div id="main-container">
	
		$Layout
	
	</div> <!-- #main-container -->
	
	<div id="footer-container">
		<footer class="wrapper">
				<p><div class="fb-like" data-href="https://www.facebook.com/iowacitybookfestival" data-send="true" data-layout="button_count" data-width="100" data-show-faces="false"></div> <a href="http://lib.uiowa.edu/" target="_blank"> The University of Iowa Libraries </a> | Iowa City, IA 52242-1420 - (319) 335-5299 - &copy; <a href="http://www.uiowa.edu/">The University of Iowa</a> $Now.Year. All rights reserved </p>
		</footer>
	</div>
	<div class="pattern"></div>
<script src="{$ThemeDir}/js/script.js"></script>
<script>
	var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
	(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
	g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
	s.parentNode.insertBefore(g,s)}(document,'script'));
</script>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=242901859120617";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
</body>
</html>
