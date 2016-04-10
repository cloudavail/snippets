# Objective
Load configuration from a path to a file as specified in the environment.

# Instructions
1. Set the path to the file as follows by running the following command in a terminal window: `export CONFIG_PATH='./config/development.cfg'`
2. Run the application by running: `./get_config_from_env.py`

# Outcome
If the file specified by the `CONFIG_PATH=` environment variable doesn't exist, the application will exit.
If the file specified by the `CONFIG_PATH=` environment variable does exist, the contents of this file will be loaded.
