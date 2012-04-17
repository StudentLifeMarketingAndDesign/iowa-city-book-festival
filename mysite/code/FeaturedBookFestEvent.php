<?php
class FeaturedBookFestEvent extends BookFestEvent {

	public static $db = array(
	);
	public static $has_one = array(
	);
	
	
	public static $icon =  array("themes/afterclass2/images/featured-event", "file");
	
	
	

}
class FeaturedBookFestEvent_Controller extends BookFestEvent_Controller {
	public static $allowed_actions = array (
	);
	
	public function init() {
		parent::init();
	}

}