#!/usr/bin/env python3

import os

path = "08 G.O.M.D copy 17.mp3"
string_split_on_period = os.path.splitext(path)

# prints '08 G', 'O', 'M', 'D copy 17'
print(string_split_on_period[0])