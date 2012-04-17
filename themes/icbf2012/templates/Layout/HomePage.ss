
<div id="main" class="wrapper clearfix home">


		    <script type="text/javascript" src="{$ThemeDir}/js/jquery-1.7.1.min.js"></script>
		    <script type="text/javascript" src="{$ThemeDir}/js/nivo-slider/jquery.nivo.slider.pack.js"></script>
		    <link rel="stylesheet" href="{$ThemeDir}/js/nivo-slider/nivo-slider.css" type="text/css" media="screen" />
		    <link rel="stylesheet" href="{$ThemeDir}/js/nivo-slider/themes/default/default.css" type="text/css" media="screen" />
		    <script type="text/javascript">
		    $(window).load(function() {
		        $('#slider').nivoSlider();
		    });
		    </script>

			<div id="homepage-slider">
			<div class="slider-wrapper theme-default">
            <div class="ribbon"></div>
            <div id="slider" class="nivoSlider">
                <img src="{$ThemeDir}/images/example_slider/toystory.jpg" alt="" />
                <a href="http://dev7studios.com"><img src="{$ThemeDir}/images/example_slider/toystory.jpg" alt="" title="This is an example of a caption" /></a>
                <img src="{$ThemeDir}/images/example_slider/toystory.jpg" alt="" data-transition="slideInLeft" />
                <img src="{$ThemeDir}/images/example_slider/toystory.jpg" alt="" title="#htmlcaption" />
            </div>
            <div id="htmlcaption" class="nivo-html-caption">
                <strong>This</strong> is an example of a <em>HTML</em> caption with <a href="#">a link</a>.
            </div>
        </div>
        
        </div>
        <div class="clear"></div>

		
		<article>
		
		<section>
		<% control Page(schedule) %>
			<h2>Featured Events</h2>
			<div class="homepage-featured-events">
			<% control UpcomingEvents %>
				<% control Event %>
					<div class="homepage-featured-event">
						<% control Image %>
						<% control SetRatioSize(574,176) %>
						<img src="$URL" />
						<% end_control %>
						<% end_control %>
						<div class="homepage-featured-event-content">
						
							<h3><a href="$Link">$Title</a></h3>
							
							<% if LocationLink %>
								<p><a href="$LocationLink">$Location</a></p>
							<% else %>
								<p>$Location</p>
							<% end_if %>
						
						<% control DateAndTime %>
						<p> <a href="{$BaseHref}schedule/view/$StartDate.Format(Ymd)" class="date-link"><time itemprop="startDate" datetime="$StartDate.format(c)">$StartDate.format(M). $StartDate.format(j)</time> </a> <% if StartTime %>
							at $StartTime.Nice
							<% end_if %>
						
							<% if EndDate %>
							- <a href="{$BaseHref}schedule/view/$EndDate.Format(Ymd)" class="date-link"> <time itemprop="endDate" datetime="$EndDate.format(c)">$EndDate.format(M). $EndDate.format(j)</time> </a>
							<% end_if %>
					
						</p>
						<% end_control %>
						
						
							<p>$Content.Summary(30) </p>
							<p><a href="$Link">read more</a></p>
							<div class="clear"></div>
						</div>
					</div>
				<% end_control %>
			<% end_control %>
			
			$Content
			$Form
		<% end_control %>
		</section>
	
	</article>
			
			<aside>
			<ul class="day-links">
				<li><a href="#">Friday, July 13</a></li>
				<li><a href="#">Saturday, July 14</a></li>
				<li><a href="#">Sunday, July 15</a></li>
			</ul>
			
			<% include Sidebar %>

			</aside>
			
		</div> <!-- #main -->
