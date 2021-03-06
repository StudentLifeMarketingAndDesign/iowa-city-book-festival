<header id="secondary_header">
	<h1>$Title</h1>
</header>
<div id="single-page-content">

<div>
<div id="Content" class="searchResults">
     
    <% if Query %>
        <h2>Event listing results for: &quot;{$Query}&quot;</h2>
    <% end_if %>
         
    <% if Results %>
    <ul id="SearchResults">
        <% control Results %>
        <li>
        <h2>
            <a class="searchResultHeader" href="$Link">
                <% if MenuTitle %>
                $MenuTitle
                <% else %>
                $Title
                <% end_if %>
            </a>
          </h2>
            <p>$Content.Summary(50)</p>
            <a class="readMoreLink" href="$Link" title="Read more about &quot;{$Title}&quot;">Read More</a>
        </li>
        <% end_control %>
    </ul>
    <% else %>
    <p>Sorry, your search query did not return any results.</p>
    <% end_if %>
             
    <% if Results.MoreThanOnePage %>
    <div id="PageNumbers">
        <% if Results.NotLastPage %>
        <a class="next" href="$Results.NextLink" title="View the next page">Next</a>
        <% end_if %>
        <% if Results.NotFirstPage %>
        <a class="prev" href="$Results.PrevLink" title="View the previous page">Prev</a>
        <% end_if %>
        <span>
            <% control Results.Pages %>
                <% if CurrentBool %>
                $PageNum
                <% else %>
                <a href="$Link" title="View page number $PageNum">$PageNum</a>
                <% end_if %>
            <% end_control %>
        </span>
        <p>Page $Results.CurrentPage of $Results.TotalPages</p>
    </div>
    <% end_if %>
</div>
</div>
</div>
