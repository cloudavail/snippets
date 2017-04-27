#!/usr/bin/env python

# mlb_teams_and_records includes only teams from the National League West

mlb_teams_and_records = {
 'Colorado': { 'name': 'Rockies', 'wins': 14, 'loses': 8},
 'Arizona': { 'name': 'Diamondbacks', 'wins': 14, 'loses': 9},
 'Los_Angeles': { 'name': 'Dodgers', 'wins': 10, 'loses': 12},
 'San_Diego': { 'name': 'Padres', 'wins': 9, 'loses': 14},
 'San_Francisco': { 'name': 'Giants', 'wins': 8, 'loses': 14}
}

# prints teams in an "unsorted" order
print 'Printing Teams in Unsorted Order:'
for mlb_team in mlb_teams_and_records:
  print mlb_team

print 'Printing Teams in Sorted Order by Key:'
for mlb_team in sorted(mlb_teams_and_records):
  print mlb_team
