<?php

class Product extends DbObject {
    // name of database table
    const DB_TABLE = 'product';

    // database fields
    protected $id;
    protected $title;
    protected $brand;
    protected $size;
    protected $speed;
    protected $weight;
    protected $price;
    protected $price_range;
    protected $hard_drive;
    protected $img_url;
    protected $basic_description;
    protected $secondary_desc;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'title' => '',
            'brand' => '',
            'weight' => '',
            'speed' => '',
            'hard_drive' => '',
            'basic_description' => null,
            'secondary_desc' => null,
            'price' => 0,
            'price_range' => '',
            'size' => '',
            'img_url' => null,
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->title = $args['title'];
        $this->brand = $args['brand'];
        $this->speed = $args['speed'];
        $this->weight = $args['weight'];
        $this->basic_description = $args['basic_description'];
        $this->secondary_desc = $args['secondary_desc'];
        $this->price = $args['price'];
        $this->price_range = $args['price_range'];
        $this->size = $args['size'];
        $this->hard_drive = $args['hard_drive'];
        $this->img_url = $args['image_url'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'title' => $this->title,
            'brand' => $this->brand,
            'speed' => $this->speed,
            'weight' => $this->weight,
            'basic_description' => $this->basic_description,
            'secondary_desc' => $this->secondary_desc,
            'price' => $this->price,
            'price_range' => $this->price_range,
            'size' => $this->size,
            'hard_drive' => $this->hard_drive,
            'image_url' => $this->img_url,
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    // load all products
    public static function getAllProducts($limit=null) {
        $query = sprintf(" SELECT * FROM %s ORDER BY id ASC ",
            self::DB_TABLE
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysql_num_rows($result))
            return null;
        else {
            return ($result);
        }
    }

}
