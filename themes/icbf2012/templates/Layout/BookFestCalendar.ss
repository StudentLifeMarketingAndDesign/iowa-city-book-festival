<div id="main" class="wrapper clearfix">

	<article>
		<header>
			<h1>$Title</h1>
		</header>
		<section>

			<ul>
			<% control UpcomingEvents %>
				<% control Event %>
				<li><a href="$Link">$Title</a></li>
				<% end_control %>
			<% end_control %>
			</ul>
					
			$Content
			$Form
		</section>
	
	</article>
			
			<aside>
				<h3>aside</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sodales urna non odio egestas tempor. Nunc vel vehicula ante. Etiam bibendum iaculis libero, eget molestie nisl pharetra in. In semper consequat est, eu porta velit mollis nec. Curabitur posuere enim eget turpis feugiat tempor. Etiam ullamcorper lorem dapibus velit suscipit ultrices.</p>
			</aside>
			
		</div> <!-- #main -->
