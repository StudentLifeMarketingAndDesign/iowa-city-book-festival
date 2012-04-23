		<div class="event">
					<% if Image %>
						<a href="$Link">
						<% control Image %>
							<% control SetRatioSize(574,176) %>
							<img src="$URL" />
							<% end_control %>
						<% end_control %>
						</a>
					<% end_if %>
					<div class="event-content">	
						<h3><a href="$Link">$Title</a></h3>
<% if LocationLink %>
								<p><a href="$LocationLink">$Location</a></p>
							<% else %>
								<p>$Location</p>
							<% end_if %>
						
						<% if DateAndTime %>
							<% control DateAndTime %>
							<p> <a href="{$BaseHref}schedule/view/$StartDate.Format(Ymd)" class="date-link"><time itemprop="startDate" datetime="$StartDate.format(c)">$StartDate.format(l), $StartDate.format(F) $StartDate.format(j)</time> </a> <% if StartTime %>
								at $StartTime.Nice
								<% end_if %>
							
								<% if EndDate %>
								- <a href="{$BaseHref}schedule/view/$EndDate.Format(Ymd)" class="date-link"> <time itemprop="endDate" datetime="$EndDate.format(c)">$StartDate.format(l), $EndDate.format(F) $EndDate.format(j)</time> </a>
								<% end_if %>
						
							</p>
							<% end_control %>
						<% end_if %>
						
							<p>$Content.Summary(30) </p>
							<p><a href="$Link">read more</a></p>
							<% if Tags %>
							<p>Tagged as: 
	    						<% control Tags %>
	    							<a href="$Link">$Title</a><% if Last %><% else %>, <% end_if %>
	    						<% end_control %>
	    					<% end_if %>
							<div class="clear"></div>
					</div>
				</div><!-- end event -->