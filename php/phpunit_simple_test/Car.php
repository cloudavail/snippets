<?php
class Car {
    public $make;  // Items in our shopping cart
    public $model;  // Items in our shopping cart
    public $year;  // Items in our shopping cart

    public function __construct ( $make, $model, $year ) {
        $this->make = $make;
        $this->model = $model;
        $this->year = $year;
    }
}

// $colin_car = new Car("Volvo", 242, 1979);
// echo "Make is: {$colin_car -> make}\n";
// echo "Model is: {$colin_car -> model}\n";
// echo "Year is: {$colin_car -> year}\n";

?>