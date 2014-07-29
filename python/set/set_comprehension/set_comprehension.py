#!/usr/bin/env python

mlb_teams = set()

mlb_teams.add('losangeles_dodgers')
mlb_teams.add('oakland_athletics')
mlb_teams.add('sanfrancico_giants')

print '\n'.join(str(team) for team in mlb_teams)
