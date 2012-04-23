<div id="main" class="wrapper clearfix">

	<article>
		<header>
		
		<% if action = view %>
			<h1 class="date-header event-list-header">Events on $DateHeader</h1>
			<% if Events %>
			<% else %>
				<p class="homepage-message">No events currently listed on this date. Please check back soon for the full schedule!</p>
			<% end_if %>
		<% else_if action = index %>
			<h1 class="event-list-header">Full Schedule</h1>
		<% end_if %>
		</header>
		<section>

		

			
			<% control Events %>
				<% control Event %>
					<% include Event %>
				<% end_control %>
			<% end_control %>
			
					
			$Content
			$Form
		</section>
	
	</article>
			
			<aside>
				<% include Sidebar %>
			</aside>
			
		</div> <!-- #main -->
