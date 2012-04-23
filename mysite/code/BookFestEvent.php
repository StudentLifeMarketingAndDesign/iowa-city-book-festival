<?php

class BookFestEvent extends CalendarEvent {
	static $many_many = array (
		"Tags" => "Tag",
	);
	public static $db = array(
		'Title' =>'Text',
		'Location' => 'Text',
		'LocationLink' => 'Text',
		'Cost' => 'Text',
		'Featured' => 'Boolean',

	);
	static $has_one = array(
		'Image' => 'SizedImage'
	);
	
	static $defaults = array (
		"ParentID" => 1
	);
	
	static $default_parent = "events"; // URLSegment of default parent node.
	static $can_be_root = false;
	static $allowed_children = "none";
	
		function onBeforeWrite(){
		parent::onBeforeWrite();
		
		
		if($this->Featured){
			$this->ClassName = "FeaturedBookFestEvent";
		}else {
			$this->ClassName = "BookFestEvent";
		
		}
	
	
	}
		
	function RelatedEvents() {
		$ids = array();
		
		// Get IDs of all events in these categories.
		foreach($this->Sponsors() as $category) {
		  $ids = array_merge($ids,$category->AfterClassEvents()->column('ID'));
		}
		foreach($this->Venues() as $category) {
		  $ids = array_merge($ids,$category->AfterClassEvents()->column('ID'));
		}
		foreach($this->Eventtypes() as $category) {
		  $ids = array_merge($ids,$category->AfterClassEvents()->column('ID'));
		}
		
		// Setup filter
		$filter = "`CalendarDateTime`.EventID IN (" . implode(',',$ids) . ")";
		// Get the calendar
		$calendar = DataObject::get_one("AfterClassCalendar");
		// Get the events from the calendar
		if (empty($ids)) {
			return false;
		} else {
			#($filter = null, $start_date = null, $end_date = null, $default_view = false, $limit = null, $announcement_filter = null)
			$events = $calendar->Events($filter,null,null,false,'4')->groupBy('EventID'); #Figure out how to GROUP BY `CalendarDateTime`.EventID
			$eventSet = new DataObjectSet();
			foreach($events as $event => $data) {
			    $eventSet->push($data->First()); //Get only the first of each event.
			}
			return $eventSet;
		}
	}
	
		
	
	function getCMSActions() {
		$actions = parent::getCMSActions();
		//$Action = new FormAction(
		//	"doFacebook",
		//	"Post To Facebook"
        //);
		//$actions->push($Action);
		return $actions;
	}
	
	public function getCMSFields() {
		$f = parent::getCMSFields();
		
/* ------------------------------ */
/* Remove / Rename Default Fields */
/* ------------------------------ */

		$f->fieldByName('Root.Content.Main')->setTitle('Event Details');
		$f->fieldByName('Root.Content.Main.Title')->setTitle('Event Name');
		$f->removeFieldFromTab('Root.Content', 'MenuTitle'); // remove a field from a tab
		$f->removeFieldFromTab('Root.Content', 'Content'); // remove a field from a tab
		$f->removeFieldFromTab('Root.Content.Metadata', 'URL'); 
		$f->removeFieldFromTab('Root.Content', 'Metadata'); // remove a field from a tab	
		$f->removeFieldFromTab('Root.Content', 'GoogleSitemap'); // remove a field from a tab
		
		
		
/* -------------------------------------------------------- */
/* Rewriting the URL Field Group to move it to the main tab */
/* -------------------------------------------------------- */
		
		$url_fieldgroup = new FieldGroup(_t('SiteTree.URL', "URL"),
							new LabelField('BaseUrlLabel',Controller::join_links (
								Director::absoluteBaseURL(),
								(self::nested_urls() && $this->ParentID ? $this->Parent()->RelativeLink(true) : null)
							)),
							new UniqueRestrictedTextField("URLSegment",
								"URLSegment",
								"SiteTree",
								_t('SiteTree.VALIDATIONURLSEGMENT1', "Another page is using that URL. URL must be unique for each page"),
								"[^A-Za-z0-9-]+",
								"-",
								_t('SiteTree.VALIDATIONURLSEGMENT2', "URLs can only be made up of letters, digits and hyphens."),
								"",
								"",
								"",
								50
							),
							new LabelField('TrailingSlashLabel',"/"));
		
/* ----------------------------------- */
/* Add/Re-Add Content and Other Fields */
/* ----------------------------------- */
		
		$f->addFieldToTab("Root.Content.Main", $url_fieldgroup);
		$f->addFieldToTab('Root.Content.Main', new ImageField('Image','Event Image'));
		
		
		//$params = array('parent' => $this->ID, 'transaction' => "generic", 'imgstate' => 'existing'); //$this->Image->TransactionKey
		//$f->push(new PixlrEditorField('PixlrButton', _t('Pixlr.EDIT_IMAGE', 'Edit this image'), $this->Image, $params));
		
		
		$f->addFieldToTab('Root.Content.Main',new TextField('Location','Location') );
		$f->addFieldToTab('Root.Content.Main',new TextField('LocationLink','Location link') );
		//$f->addFieldToTab('Root.Content.Main',new TextField('Cost','Admission Cost (examples: "Free", "$5")') );
		$f->addFieldToTab('Root.Content.Main',new CheckboxField('Featured','Feature this event on the homepage and category pages'));
		$f->addFieldToTab('Root.Content.Main',new TextField('CancelReason','If this event is canceled/full, enter the reason here. Example: "Class is full!"') );
		$f->addFieldToTab('Root.Content.Main',new HTMLEditorField('Content','Event Description') );
		
		
/* --------- */
/* Tag Table */
/* --------- */
		$categoryTablefield = new ManyManyComplexTableField(
        	$this,
        	'Tags',
        	'Tag',
        	array(
       		'Title' => 'Title'
        	),
        	'getCMSFields_forPopup',
        	null,
        	$sort = "Title ASC"
      	);
		$categoryTablefield->setAddTitle( 'Tags' );
		$categoryTablefield->showPagination = false;
		
		$f->addFieldToTab('Root.Content.Tags', new HeaderField("TagsHeader","Tags"));

		$f->addFieldToTab( 'Root.Content.Tags', $categoryTablefield );
	
		return $f;
	}
	

	
}

class SizedImage extends Image {
	function generateSmallImage($gd) {
		$gd->SetQuality(90);
		return $gd->croppedResize(130,110);
	}
	function generateMediumImage($gd) {
		$gd->SetQuality(90);
		return $gd->croppedResize(340,290);
	}
	function generateLargeImage($gd) {
		$gd->SetQuality(90);
		return $gd->croppedResize(400,380);
	}
}

class BookFestEvent_Controller extends CalendarEvent_Controller {
	public static $url_handlers = array(
            'fbpublish' => 'fbpublish'
            );
 	static $allowed_actions = array ("fbpublish");
 	
}