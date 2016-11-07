<?php

class Shipment extends DbObject {
    // name of database table
    const DB_TABLE = 'shipment';

	//TODO: remove unneeded fields if possible.
	
    // database fields
    protected $id;
    protected $to_address;
	protected $from_address;
    protected $return_address;
    protected $buyer_address;
    protected $parcel;
    protected $customs_info;
	protected $scan_form;
	protected $forms;
	protected $insurance;
	protected $rates;
	protected $selected_rate;
	protected $postage_label;
	protected $messages;
	protected $options;
	protected $is_return;
	protected $tracking_code;
	protected $usps_zone;
	protected $status;
	protected $tracker;
	protected $fees;
	protected $refund_status;
	protected $batch_id;
	protected $batch_message;
	

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
             'id' => NULL,
			 'to_address' => NULL,
			 'from_address' => NULL,
			 'return_address' => NULL,
			 'buyer_address' => NULL,
			 'parcel' => NULL,
			 'customs_info' => NULL,
			 'scan_form' => NULL,
			 'forms' => NULL,
			 'insurance' => NULL,
			 'rates' => NULL,
			 'selected_rate' => NULL,
			 'postage_label' => NULL,
			 'messages' => NULL,
			 'options' => NULL,
			 'is_return' => '',
			 'tracking_code' => '',
			 'usps_zone' => '',
			 'status' => '',
			 'tracker' => NULL,
			 'fees' => '',//create default fee???
			 'refund_status' => '',
			 'batch_id' => '',
			 'batch_message' => '',
            );

        $args += $defaultArgs;
		
        $this->id = $args['id'];
		$this->to_address = $args['to_address'];
		$this->from_address = $args['from_address'];
		$this->return_address = $args['return_address'];
		$this->buyer_address = $args['buyer_address'];
		$this->parcel = $args['parcel'];
		$this->customs_info = $args['customs_info'];
		$this->scan_form = $args['scan_form'];
		$this->forms = $args['forms'];
		$this->insurance = $args['insurance'];
		$this->rates = $args['rates'];
		$this->selected_rate = $args['selected_rate'];
		$this->postage_label = $args['postage_label'];
		$this->messages = $args['messages'];
		$this->options = $args['options'];
		$this->is_return = $args['is_return'];
		$this->tracking_code = $args['tracking_code']; 
		$this->usps_zone = $args['usps_zone'];
		$this->status = $args['status'];
		$this->tracker = $args['tracker'];
		$this->fees = $args['fees'];//create default fee???
		$this->refund_status = $args['refund_status'];
		$this->batch_id = $args['batch_id'];
		$this->batch_message = $args['batch_message'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
			'id' => $this->id,
            'street1' => $this->street1,
            'street2' => $this->street2,
			'city' => $this->city,
			'state' => $this->state,
			'zip' => $this->zip,
			'county' => $this->county,
			'residential' => $this->residential,
			'carrier_facility' => $this->carrier_facility,
			'name' => $this->name,
			'company' => $this->company,
			'phone' => $this->phone,
            'email' => $this->email,
            'federal_tax_id' => $this->federal_tax_id,
            'state_tax_id' => $this->state_tax_id
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

	//other functions here.

}
