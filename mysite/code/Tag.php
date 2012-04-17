<?php
class Tag extends DataObject {
	public static $db = array(
		"Title" => "Text",
		"Showmenu" => "Boolean"
	);
	function getCMSFields_forPopup() {
		$fields = new FieldSet();
		$fields->push( new TextField( 'Title' ) );
		//$fields->push( new CheckboxField('Showmenu', 'Show in Main Menu?') );
		return $fields;
	}
	
	public static $belongs_many_many = array(
		"BookFestEvents" => "BookFestEvent"
	);
	
	
	function Link(){
	
		$base_url = Director::absoluteBaseURL();
		return $base_url."/schedule/tags/".$this->Title;
	
	}
	
	
}
