# Overview

The purpose of this snippet is to provide a basic understanding of how to unit test multiple modules in a Python project.

# Executing All Unit Tests

To run the unit tests do the following: `python -m unittest discover`

# Executing All Tests within a Module (or File)

`python -m unittest tests.test_Player`
`python -m unittest tests.test_Team`

# Executing All Tests within a Class

`python -m unittest tests.test_Player.TestPlayer`
`python -m unittest tests.test_Team.TestTeam`

# Executing a Specific Test

`python -m unittest tests.test_Player.TestPlayer.test_get_full_name`
