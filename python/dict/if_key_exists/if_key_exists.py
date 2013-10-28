#!/usr/bin/env python

# objective one: set variable to a value within a dictionary if the key
# exists.
# objective two: set variable to a value within a nested dictionary if the
# key exists.

states_and_capitals = {'California': 'Sacramento', 'Virgina': 'Richmond'}

variable_exists = states_and_capitals['California']
if 'Gotham' in states_and_capitals:
    variable_does_not_exist = states_and_capitals['Gotham']
else:
    variable_does_not_exist = 'No Key'

print 'Variable Exists: ' + variable_exists
print 'Variable Does Not Exist: ' + variable_does_not_exist

# below would result in error
# variable_does_not_exist = states_and_capitals['Gotham']
# if states_and_capitals['Gotham'] is not None:
#   variable_exists = states_and_capitals['Gotham']
#
# below is deprecated
# if states_and_capitals.has_key('Gotham'):

country_capital_and_capital_population = {'USA': {'Capital': 'Washington D.C.'},
                                          'Philippines': {'Capital': 'Manila'},
                                          'Narnia': '',
                                          'Mexico': {'Capital': 'Mexico City'}}
for country in country_capital_and_capital_population:
    if 'Capital' in country_capital_and_capital_population[country]:
        capital_name = country_capital_and_capital_population[country]['Capital']
    else:
        capital_name = 'Capital Name not Defined'
    print 'Country: ' + country + ', Capital: ' + capital_name
