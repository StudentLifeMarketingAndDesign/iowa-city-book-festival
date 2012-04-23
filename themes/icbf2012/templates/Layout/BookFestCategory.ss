<div id="main" class="wrapper clearfix">

	<article>
		<header>
			<h1>Tagged as $TagName:</h1>
		</header>
		<section>
		<% control Tag %>
			<% if BookFestEvents %>
				<% control BookFestEvents %>
				
						<% include Event %>
		
				<% end_control %>
			<% else %>
				<p>No events currently in this category. Please check back soon for the full schedule!</p>
			<% end_if %>
		<% end_control %>
					
			$Content
			$Form
		</section>
	
	</article>
			
			<aside>
				<% include Sidebar %>
			</aside>
			
		</div> <!-- #main -->
