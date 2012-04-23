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
	
		function Events($limit = null) {
		$ids = array();
		// Get IDs of all events in this category.
		$ids = array_merge($ids,$this->BookFestEvents()->column('ID'));
		
		// Setup filter
		$filter = "`CalendarDateTime`.EventID IN (" . implode(',',$ids) . ")";
		// Get the calendar
		$calendar = DataObject::get_one("BookFestCalendar");
		// Get the events from the calendar
		if (empty($ids)) {
			return false;
		} else {
			$events = $calendar->Events($filter,null,null,null,$limit);
			
			$events->removeDuplicates('EventID');
				
			
			return $events;
		}
	}
	
	
}
