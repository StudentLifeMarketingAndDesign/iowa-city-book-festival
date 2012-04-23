<?php

class BookFestCalendar extends Calendar {
/* static $has_many = array (
 'EventCategories' => 'EventCategory'
 );*/
	static $allowed_children = array (
	'BookFestEvent'
	);
		
	public function AllFeaturedEvents() {
	    return DataObject::get("BookFestEvent","Featured IS TRUE");
	}
	public function Eventtype() {
	    return DataObject::get("Eventtype");
	}
	public function Sponsor() {
	    return DataObject::get("Sponsor");
	}
	public function Venue() {
	    return DataObject::get("Venue");
	}
	
	
	function FeaturedEvents() {
		$ids = array();
		// Get IDs of all featured events.
		$ids = array_merge($ids,$this->AllFeaturedEvents()->column('ID'));
		// Setup filter
		$filter = "`CalendarDateTime`.EventID IN (" . implode(',',$ids) . ")";
		// Get the calendar
		$calendar = DataObject::get_one("BookFestCalendar");
		// Get the events from the calendar
		if (empty($ids)) {
			return false;
		} else {
			return $calendar->Events($filter);
		}
	}
	
}
 
class BookFestCalendar_Controller extends Calendar_Controller {
 	 public static $url_handlers = array(
            'tags/$Tag' => 'tags',
           // 'tags/$Tag/rss/' => 'categoriesrss',

            );
 	static $allowed_actions = array ("tags", "view", "category", "newrss", "categoriesrss");

 	
 		
	function AllEvents() {
		$start_date = date( "d/m/Y", time() );
		$end_date = date('Y-m-d',strtotime(date("Y-m-d", mktime()) . " + 365 day"));
		
		$events =  parent::Events(null,$start_date,$start_date,false,1000);
		
		$events->removeDuplicates('EventID');
		//print_r($events);
		if($events){
			return $events;
		}else{
			return null;
		
		
		}
	}
	
 	function tags() {
 	
 		$tagName = addslashes($this->urlParams['Tag']);
 		$TagObject = DataObject::get_one("Tag", "Title = '".$tagName."'");
 		$Data = array(
	      'Tag' => $TagObject,
	      'TagName' => stripslashes($tagName)
	    );
	    
 		return $this->customise($Data)->renderWith(array('BookFestCategory', 'Calendar', 'Page'));
 	}
 	 	
  	public function init() {
		parent::init();
	}
 
 }