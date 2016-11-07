<?php

class Parcel extends DbObject {
    // name of database table
    const DB_TABLE = 'parcel';

    // database fields
    protected $id;
    protected $length;
	protected $width;
    protected $height;
    protected $predefined_package;
    protected $weight;
    protected $created_at;
	protected $updated_at;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'length' => '',
            'width' => '',
			'height' => '',
			'predefined_package' => '',
			'weight' => ''
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->length = $args['length'];
        $this->width = $args['width'];
        $this->height = $args['height'];
        $this->predefined_package = $args['predefined_package'];
        $this->weight = $args['weight'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
			'id' => $this->id,
            'id' => $this->id,,
            'length' => $this->length,
            'width' => $this->width,
			'height' => $this->height,
			'predefined_package' => $this->predefined_package,
			'weight' => $this->weight
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
