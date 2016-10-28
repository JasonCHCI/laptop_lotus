<?php

class User extends DbObject {
    // name of database table
    const DB_TABLE = 'orders';

    // database fields
    protected $user_id;
    protected $firstName;
    protected $lastName;
    protected $city;
    protected $state;
    protected $address;
    protected $country;
    protected $zipcode;
    protected $phone;
    protected $creditcard;
    protected $expiration;
    protected $items;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'firstName' => '',
            'lastName' => '',
            'address' => null,
            'city' => null,
            'state' => null,
            'country' => null,
            'zipcode' => null,
            'phone' => null,
            'creditcard' => null,
            'cvv' => null,
            'expiration' => null,
            'items' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->firstName = $args['firstName'];
        $this->lastName = $args['lastName'];
        $this->address = $args['address'];
        $this->city = $args['city'];
        $this->state = $args['state'];
        $this->country = $args['country'];
        $this->zipcode = $args['zipcode'];
        $this->phone = $args['phone'];
        $this->creditcard = $args['creditcard'];
        $this->cvv = $args['cvv'];
        $this->expiration = $args['expration'];
        $this->items = $args['items'];

    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'firstName' => $this->firstName,
            'lastName' => $this->lastName,
            'address' => $this->address,
            'city' => $this->city,
            'state' => $this->state,
            'country' => $this->country,
            'zipcode' => $this->zipcode,
            'phone' => $this->phone,
            'creditcard' => $this->creditcard,
            'cvv' => $this->cvv,
            'expiration' => $this->expiration,
            'items' => $this->items
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    // load user by firstName
    public static function loadByfirstName($firstName=null) {
        if($firstName === null)
            return null;

        $query = sprintf(" SELECT id FROM %s WHERE firstName = '%s' ",
            self::DB_TABLE,
            $firstName
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysql_num_rows($result))
            return null;
        else {
            $row = mysql_fetch_assoc($result);
            $obj = self::loadById($row['id']);
            return ($obj);
        }
    }

}
