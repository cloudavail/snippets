#!/usr/bin/env python

# objective: pass arguments as dictionary


# creates the function "argument_catcher" and accepts the following keywords
def argument_catcher(city, population, size, state):
    print 'city: {!s}'.format(city)
    print 'state: {!s}'.format(state)
    print 'population: {!s}'.format(population)
    print 'size: {!s} miles'.format(size)

# creates the dictionary to be passed to the "argument_catcher" function
arguments_dict = {'city': 'San Francisco', 'population': 800000, 'size': 49,
                  'state': 'California'}

# calls the function "argument_catcher" with the previously created dictionary
argument_catcher(**arguments_dict)
