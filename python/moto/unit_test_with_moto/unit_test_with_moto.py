# objective - to perform a unit test of a boto object

import unittest
from random import randint


import boto

from moto import mock_ec2
from create_instances import create_x_instances


class Tests(unittest.TestCase):

    @mock_ec2
    def test_create_x_instances_cont(self):
        '''
        ensures that create_x_instances does the following:
        1. creates EC2 instances
        2. creates the correct number of instances
        '''

        test_instance_count = randint(0, 50)
        create_x_instances(desired_instances=test_instance_count)
        conn = boto.ec2.connect_to_region('us-east-1')
        # since the moto AWS account is empty, we can count all instances
        created_instances = conn.get_all_instances()
        all_instances = [reservation.instances[0].id for reservation in created_instances]
        created_instances_count = len(all_instances)
        self.assertEqual(created_instances_count, test_instance_count)

unittest.main()
