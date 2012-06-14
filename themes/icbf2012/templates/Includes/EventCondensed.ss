<td><% if DateAndTime %>
		<% control DateAndTime %>
			 <% if StartTime %>$StartTime.Nice<% end_if %>
		<% end_control %>
	<% end_if %>
</td>
<td><a href="$Link"> $Title </a> </td>
<td>
	<% if LocationLink %>
		<a href="$LocationLink">$Location</a>
	<% else %>
		$Location
	<% end_if %> 
</td>

</li>
