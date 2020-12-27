#!/usr/bin/env python3

string = "08 G.O.M.D copy 17.mp3"
string_split_on_period = string.split(".")
string_without_extension = string_split_on_period[0:-1]

# prints '08 G', 'O', 'M', 'D copy 17' with [0:-1]
print(string_without_extension)