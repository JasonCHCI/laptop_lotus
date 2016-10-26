<?php

class Cart extends DbObject {
    // name of database table
    const DB_TABLE = 'cart';

    // database fields
    protected $id;
    protected $product_id;
    protected $user_id;
    protected $count;
    protected $date_added;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            '$product_id' => '',
            '$user_id' => '',
            'count' => 0,
            'date_added' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->product_id = $args['product_id'];
        $this->user_id = $args['product_id'];
        $this->count = $args['count'];
        $this->date_added = $args['date_added'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'product_id' => $this->product_id,
            'user_id' => $this->user_id,
            'count' => $this->count,
            'date_added' => $this->date_added
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    // load by user id and product id
    public static function loadByPIDUID($pid=null, $uid=null) {
        if($pid === null || $uid === null)
            return null;

        $query = sprintf(" SELECT id FROM %s WHERE product_id = '%d' AND user_id = '%d' ",
            self::DB_TABLE,
            $pid,
            $uid
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

    // load by user id and product id
    public static function loadByUID($uid=null) {
        if($pid === null || $uid === null)
            return null;

        $query = sprintf(" SELECT id FROM %s WHERE user_id = '%d' ",
            self::DB_TABLE,
            $uid
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
