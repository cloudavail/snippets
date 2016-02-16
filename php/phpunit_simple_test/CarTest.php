<?php

require 'Car.php';
require __DIR__ . '/vendor/autoload.php';

// if testing the "Car" class the name of the test should be
// "CarTest"
// the given test /typically/ inherits from PHPUnit_Framework_TestCase
class CarTest extends PHPUnit_Framework_TestCase {
    // tests are public methods that expect no parameters and are named test*

    public function testCarMake() {
        $test_car = new Car('Volvo', 242, 1979);
        $this->assertEquals('Volvo', $test_car -> make);
        unset($test_car);
    }

    public function testCarModel() {
        $test_car = new Car('Volvo', 242, 1979);
        $this->assertEquals(242, $test_car -> model);
        unset($test_car);
    }

    public function testCarYear() {
        $test_car = new Car('Volvo', 242, 1979);
        $this->assertEquals(1979, $test_car -> year);
        unset($test_car);
    }

    // and a failing assertion
    public function testCarYearFailure() {
        $test_car = new Car('Volvo', 242, 1979);
        $this->assertEquals(1980, $test_car -> year);
        unset($test_car);
    }
}

?>
