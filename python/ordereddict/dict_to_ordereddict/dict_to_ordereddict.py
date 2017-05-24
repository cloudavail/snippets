#!/usr/bin/env python

from collections import OrderedDict 


def sort_by_cost(car):
    print 'sort by cost called'
    print car
    return car[1]['cost']

# objective: take an existing dict, apply a "sort" and then insert into an OrderedDict
# specifically - take the cars I have owned and sort them by price

cars = {}
cars['KBJMNU'] = { 'make': 'Honda', 'model': 'Accord', 'year': 2005, 'cost': 17535 }
cars['JT0NCG'] = { 'make': 'Volvo', 'model': '242', 'year': 1979, 'cost': 0 }
cars['I46SNR'] = { 'make': 'Porsche', 'model': '912', 'year': 1966, 'cost': 2000 }
cars['HI91CX'] = { 'make': 'Volvo', 'model': '740', 'year': 1985, 'cost': 2000 }

print 'The cars below are not guaranteed to be in order by cost.'
for vin, car in cars.iteritems():
    print 'vin: {}, car value: {}'.format(vin, car)

cars_ordered_by_cost = OrderedDict(sorted(cars.items(), key=sort_by_cost, reverse=True))

print 'The cars below are guaranteed to be in order by cost - but are ordered when inserted.'

for vin, car in cars_ordered_by_cost.iteritems():
    print 'vin: {}, car value: {}'.format(vin, car)
