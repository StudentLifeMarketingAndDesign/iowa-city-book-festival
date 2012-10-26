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
			<h1 class="event-list-header">Schedule</h1>
		<% end_if %>
		</header>
		<section>
		
			<%-- if We're on the home page --%>
			<% if action = index %>
				
				<% control Events %>
					<% control Event %>
						<% include Event %>
					<% end_control %>
				<% end_control %>	
				
			<%-- else if we're on the day/tag pages --%>
			
			<% else %>
				<table class="events-table">
					<tbody>
						<tr>
							<th>Time</th>
							<th>Event</th>
							<th>Location</th>
						</tr>
						<% control Events %>
						<tr>
							<% control Event %>
								<% include EventCondensed %>
							<% end_control %>
						</tr>
						<% end_control %>
					</tbody>
				</table>
						
			<% end_if %>
			
					
			$Content
			$Form
		</section>
	
	</article>
			
			<aside>
				<% include Sidebar %>
			</aside>
			
		</div> <!-- #main -->
