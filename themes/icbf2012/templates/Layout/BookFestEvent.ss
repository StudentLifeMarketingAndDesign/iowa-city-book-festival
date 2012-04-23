<div id="main" class="wrapper clearfix">

	<article>
		<header>
			<h1>$Title</h1>
		</header>
		<section>
		
		<% if Image %>
			<% control Image %>
				<% control SetRatioSize(400,200) %>
				<a href="$Link"><img src="$URL" class="individual-event-image" /></a>
				<% end_control %>
			<% end_control %>
		<% end_if %>

			$Content

			$Form
		</section>

	</article>

			<aside>
			
			<% include Sidebar %>
			
			</aside>
			
		</div> <!-- #main -->
