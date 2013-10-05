# objective: to understand per task arguments given at command line

# per task argument
# to test the task argument, run any of the following:
# fab single_task_argument
# fab single_task_argument:fruit=orange
# or
# fab single_task_argument:orange
def single_task_argument(fruit='apple'):
    print('Fruit is: {fruit!s}'.format (fruit=fruit))

# multiple per task arguments
# to test multiple task argument, run any of the following:
# fab multiple_task_argument
# fab multiple_task_argument:fruit=orange,vegetable=eggplant
# or
# fab multiple_task_argument:orange,eggplant
def multiple_task_argument(fruit='apple', vegetable='artichoke'):
    print('Fruit is: {fruit!s}'.format (fruit=fruit))
    print('Vegetable: {vegetable!s}'.format (vegetable=vegetable))