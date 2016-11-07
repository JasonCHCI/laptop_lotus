<?php

class Address extends DbObject {
    // name of database table
    const DB_TABLE = 'address';

    // database fields
    protected $id;
    protected $street1;
	protected $street2;
    protected $city;
    protected $state;
    protected $zip;
    protected $country;
	protected $residential;
	protected $carrier_facility;
	protected $name;
	protected $company;
	protected $phone;
	protected $email;
	protected $federal_tax_id;
	protected $state_tax_id;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'street1' => '',
            'street2' => '',
			'city' => '',
			'state' => '',
			'zip' => '',
			'county' => '',
			'residential' => '',
			'carrier_facility' => '',
			'name' => '',
			'company' => '',
			'phone' => '',
            'email' => null,
            'federal_tax_id' => null,
            'state_tax_id' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->street1 = $args['street1'];
        $this->street2 = $args['street2'];
        $this->city = $args['city'];
        $this->state = $args['state'];
        $this->zip = $args['zip'];
        $this->county = $args['county'];
        $this->residential = $args['residential'];
        $this->carrier_facility = $args['carrier_facility'];
        $this->name = $args['name'];
        $this->company = $args['company'];
        $this->phone = $args['phone'];
        $this->email = $args['email'];
        $this->federal_tax_id = $args'federal_tax_id'];
        $this->state_tax_id = $args['state_tax_id'];
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
