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

    @classmethod
    def setUpClass(cls):
        print 'Class setUp Called'
        cls.new_car = Car('Volvo', '242')

    @classmethod
    def tearDownClass(cls):
        print 'Class tearDown Called'
        del cls.new_car

    def test_make(self):
        print 'test_make Called'
        car_make = Tests.new_car.make
        self.assertEqual(car_make, 'Volvo')

    def test_model(self):
        print 'test_model Called'
        car_model = Tests.new_car.model
        self.assertEqual(car_model, '242')


# unittest.main() runs unit tests
unittest.main()
