<?php

class Event extends DbObject {
    // name of database table
    const DB_TABLE = 'event';

    // database fields
    protected $id;
    protected $type_id;
    protected $user_id_1;
    protected $user_id_2;
    protected $product_id_1;
    protected $product_id_2;
    protected $new_data;
    protected $original_data;
    protected $count;
    protected $date_created;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'type_id' => 0,
            'user_id_1' => null,
            'user_id_2' => null,
            'product_id_1' => null,
            'product_id_2' => null,
            'new_data' => null,
            'original_data' => null,
            'count' => null,
            'date_created' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->type_id = $args['type_id'];
        $this->user_id_1 = $args['user_id_1'];
        $this->user_id_2 = $args['user_id_2'];
        $this->product_id_1 = $args['product_id_1'];
        $this->product_id_2 = $args['product_id_2'];
        $this->new_data = $args['new_data'];
        $this->original_data = $args['original_data'];
        $this->count = $args['count'];
        $this->date_created = $args['date_created'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'type_id' => $this->type_id,
            'user_id_1' => $this->user_id_1,
            'user_id_2' => $this->user_id_2,
            'product_id_1' => $this->product_id_1,
            'product_id_2' => $this->product_id_2,
            'new_data' => $this->new_data,
            'original_data' => $this->original_data,
            'count' => $this->count
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }


    public static function getAllEvents($limit=null) {
      $db = Db::instance();

      $query = sprintf("SELECT * FROM %s ORDER BY date_created DESC ",
        self::DB_TABLE
        );
      if($limit != null) {
        $query .= " LIMIT ".$limit;
      }

      $result = $db->lookup($query);
      if(!mysql_num_rows($result))
          return null;
      else {
          $objects = array();
          while($row = mysql_fetch_assoc($result)) {
              $objects[] = self::loadById($row['id']);
          }
          return ($objects);
      }
    }

    public static function getEventsByUserId($userID = null, $limit=null) {
      if($userID == null)
        return null;

      $db = Db::instance();

      $query = sprintf("SELECT * FROM `%s` WHERE user_id_1 = %d OR user_id_2 = %d ORDER BY date_created DESC ",
        self::DB_TABLE,
        $userID,
        $userID
        );
      if($limit != null) {
        $query .= " LIMIT ".$limit;
      }
      //echo $query;
      $result = $db->lookup($query);

      $objects = array();
      while($row = mysql_fetch_assoc($result)) {
          $objects[] = self::loadById($row['id']);
      }
      return ($objects);

    }

}
