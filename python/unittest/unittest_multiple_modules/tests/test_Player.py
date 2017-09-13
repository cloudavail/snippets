#!/usr/bin/env python

import unittest

# import the "Class Under Test"
import Player


# all unit tests extend unittest.TestCase
class TestPlayer(unittest.TestCase):

    def test_get_full_name(self):
        test_first_name = 'Alex'
        test_last_name = 'Morgan'
        test_full_name = '{} {}'.format(test_first_name, test_last_name)
        test_player = Player.Player(test_first_name, test_last_name)
        get_full_name_result = test_player.get_full_name()
        self.assertEqual(test_full_name, get_full_name_result)
