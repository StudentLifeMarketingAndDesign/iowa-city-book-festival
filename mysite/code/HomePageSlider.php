<?php
class HomePageSlider extends DataObject {

	public static $db = array(
		"Caption" => "Text"
	);

	public static $has_one = array(
		"Image" => "Image",
		"HomePage" => "HomePage"
	
	);
	
	
	
}