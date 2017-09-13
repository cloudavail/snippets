#!/usr/bin/env python

import datetime

class Team():

    def __init__(self, name, city, league, year_founded):
        self.name = name
        self.city = city
        self.league = league
        self.year_founded = year_founded

    def get_years_since_founding(self):
        now = datetime.datetime.now()
        current_year = now.year
        years_since_founding = current_year - self.year_founded
        return years_since_founding


if __name__ == "__main__":

    # the code below exists to instantiate a Team object
    juventus = Team('Juventus', 'Turin', 'Serie A', 1897)
    print 'Team Name: {}'.format(juventus.name)
    print 'Team City: {}'.format(juventus.city)
    print 'Team League: {}'.format(juventus.league)
    print 'Year Founded: {}'.format(juventus.year_founded)
    years_since_founding = juventus.get_years_since_founding()
    print 'Years Since Founding: {}'.format(years_since_founding)
