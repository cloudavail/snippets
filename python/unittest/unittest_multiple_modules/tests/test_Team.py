#!/usr/bin/env python

import unittest

# required to run Unit Tests
import datetime


# import the "Class Under Test"
import Team

# all unit tests extend unittest.TestCase
class TestTeam(unittest.TestCase):

    def test_get_years_since_founding(self):
        test_team = Team.Team('Juventus', 'Turin', 'Serie A', 1897)
        now = datetime.datetime.now()
        current_year = now.year
        years_since_founding = current_year - 1897
        self.assertEqual(years_since_founding, test_team.get_years_since_founding())
