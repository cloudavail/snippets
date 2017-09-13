#!/usr/bin/env python

class Player():

    def __init__(self, first_name, last_name):
        self.first_name = first_name
        self.last_name = last_name

    def get_full_name(self):
        return '{} {}'.format(self.first_name, self.last_name)

if __name__ == "__main__":

    # the code below exists to instantiate a Player object
    andrea_pirlo = Player('Andrea', 'Pirlo')
    full_name = andrea_pirlo.get_full_name()
    print 'Player Full Name: {}'.format(full_name)
