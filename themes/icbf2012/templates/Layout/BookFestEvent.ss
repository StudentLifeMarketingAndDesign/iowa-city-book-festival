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
			
			<% if LocationLink %>
				<p><a href="$LocationLink">$Location</a></p>
			<% else %>
				<p>$Location</p>
			<% end_if %>
			
			<% if DateAndTime %>
				<% control DateAndTime %>
				<p><a href="{$BaseHref}schedule/view/$StartDate.Format(Ymd)" class="date-link"><time itemprop="startDate" datetime="$StartDate.format(c)">$StartDate.format(l), $StartDate.format(F) $StartDate.format(j)</time> </a> <% if StartTime %>
					at $StartTime.Nice
					<% end_if %>
				
					<% if EndDate %>
					- <a href="{$BaseHref}schedule/view/$EndDate.Format(Ymd)" class="date-link"> <time itemprop="endDate" datetime="$EndDate.format(c)">$StartDate.format(l), $EndDate.format(F) $EndDate.format(j)</time> </a>
					<% end_if %>
			
				</p>
				<% end_control %>
			<% end_if %>
			
		</section>
	</article>

	<aside>
		<% include Sidebar %>
	</aside>
			
</div><!-- #main -->