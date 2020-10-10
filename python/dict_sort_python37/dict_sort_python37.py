#!/usr/bin/env python3

unsorted_dict = { 'SanFrancisco': 'Giants', 'LosAngeles': 'Dodgers' }
print(unsorted_dict)

sorted_dict_for_loop = {}
for key, value in sorted(unsorted_dict.items()):
    print('{}: {}'.format(key, value))
    sorted_dict_for_loop[key] = value

print(sorted_dict_for_loop)

sorted_by = { key: unsorted_dict[key] for key in sorted(unsorted_dict.keys()) }
print(sorted_by)
