
<div id="main" class="wrapper clearfix home">

	<div id="homepage-slider">
		<div class="slider-wrapper theme-default">
            <div class="ribbon"></div>
            
            <div id="slider" class="nivoSlider">
            	<% control HomePageSliders %>
            		<img src="$Image.URL" title="$Caption" />
            	<% end_control %>
            </div>
            
		</div>
    </div>
    
    <div class="clear"></div>

	<article>
		<section>
			<% control Page(schedule) %>
				<h2 class="homepage-featured-header">Featured Events</h2>
				<div class="homepage-featured-events">
				
					<% control AllFeaturedEvents %>
						<% include Event %>
					<% end_control %>
					
					$Content
					$Form
				</div>
			<% end_control %>
			
		</section>
	</article>

	<aside>
		<% include Sidebar %>
	</aside>
			
</div> <!-- #main -->
