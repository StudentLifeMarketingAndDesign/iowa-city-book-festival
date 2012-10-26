<td><% if DateAndTime %>
		<% control DateAndTime %>
			 <% if StartTime %>$StartTime.Nice <% end_if %>
		<% end_control %>
		<% else %>
			TBA
	<% end_if %>
</td>
<td><a href="$Link"> $Title </a> </td>
<td>
	<% if LocationLink %>
		<a href="$LocationLink">$Location</a>
	<% else_if Location %>
		$Location
	<% else %>
		TBA
	<% end_if %> 
</td>

</li>
