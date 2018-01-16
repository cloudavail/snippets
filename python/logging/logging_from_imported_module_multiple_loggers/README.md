# Overview
The design of this tutorial is to demonstrate logging from an imported module.

# Sample Output
Log message at CRITICAL from __main__
Log message at ERROR from __main__
Log message at WARNING from __main__
Log message at INFO from __main__
Log message at DEBUG from __main__
Log message at CRITICAL from my_module
Log message at ERROR from my_module
Log message at WARNING from my_module
Log message at INFO from my_module
Log message at DEBUG from my_module

# How It Works
Running logging_from_imported_module.py it will import my_module and then call my_module.my_function. Evidence that the imported module "my_module" is inheriting logging settings from the parent script is evidenced by the fact that changing the log level in the logging_from_imported_module.py passes these changes into my_module.