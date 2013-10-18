# Overview
This module is designed to demonstrate catching of a signal. In this case, run the script and then interrupt the script by pressing ctrl-C.

# Sample Output
The example below demonstrates the signal_interrupt.py script running for 2 seconds and exiting when a signal interrupt is caught.

    $ ./signal_interrupt.py 
    Run for 0 seconds
    Run for 1 seconds
    Run for 2 seconds
    ^C
    Interrupt Caught, exiting with return code 1.

# How It Works
The module runs for 15 seconds. If at any time during the 15 second window a signal is caught the script will catch the interrupt, run the script_interrupted function and exit.
