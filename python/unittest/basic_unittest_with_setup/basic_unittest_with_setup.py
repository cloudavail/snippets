#!/usr/bin/env python

# objective: perform "setUp" and "tearDown" test "fixtures" prior to execution
# of each test

# expected result:
# when run, program should call create and delete one "new_car" object per
# test

import unittest


class Car():

    def __init__(self, make, model):
        self.make = make
        self.model = model
        print 'Made a Car'

    def __del__(self):
        print 'Deleted a Car'


class Tests(unittest.TestCase):

    def setUp(self):
        print 'setUp Called'
        self.new_car = Car('Volvo', '242')

    def tearDown(self):
        print 'tearDown Called'
        del self.new_car

    def test_make(self):
        car_make = self.new_car.make
        self.assertEqual(car_make, 'Volvo')

    def test_model(self):
        car_model = self.new_car.model
        self.assertEqual(car_model, '242')


# unittest.main() runs unit tests
unittest.main()
