import Cocoa

var mlbTeamNamesArray = [ "Giants", "Athletics", "Dodgers", "Angels", "Mariners" ]

// looping over an Array
for team in mlbTeamNamesArray {
    println("Team name is \(team).")
}

var mlbCityAndTeamDictionary = [
    "San Francisco": "Giants",
    "Oakland": "Athletics",
    "Los Angeles": "Dodgers",
    "Anaheim": "Angels",
    "Seattle": "Mariners"
]

// looping over a Dictionary
for (city, team) in mlbCityAndTeamDictionary {
    println("The \(city) team is the \(team).")
}
