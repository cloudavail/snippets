# Code Standard and Quality
## Prototype
- A coding standard has been selected and is adhered to. Advised standards are below:
  - python: pep-8, https://www.python.org/dev/peps/pep-0008/
  - shell script: Shell Style Guide, https://google.github.io/styleguide/shell.xml

# Configuration: Arguments
## Prototype
- If needed, application supports reading of arguments via argument parsing library, if available.
  - python: argparse, https://docs.python.org/3/library/argparse.html
  - shell: getopts, https://www.mkssoftware.com/docs/man1/getopts.1.asp

# Configuration: File
## Prototype
- Application reads a configuration file (format: ideally YAML or ini)
- Configuration file path is set by a passed in argument.

# Configuration: Environment
## Production
- Application can be run in either "development", "qa" or "production" modes - which would impact data sources and log behavior.

# Dependencies
## Prototype
- Dependencies are in a defined file.
- If python, requirements.txt.

# Documentation
## Prototype
- Application contains a README.md that describes execution of the given program.

# Error Handling
## Prototype
- Application needs to support return codes using a defined standard - either 0 or 1 or FreeBSD exit codes.

# Logging
## Prototype
Language provided logging module is used.

- Logs are written to stderr.
- Log levels are used to denote critical, warning, debug and informational events. Am still determining 
  - Critical - program can not run correctly or program output may be impacted in a way the user must know.
  - Warning - not defined.
  - Informational - logs for human consumption - these may provide 
  - Debug - logs for resolving issues within a program.

# Testing
## Prototype
- No tests need to be provided.
- Manual tests, which describe a series of manually provided inputs and expected outputs may be provided.
- Smoke test is written, which describes a known input and a known output.

## Production
- Unit tests have been written.
- Integration tests have been written, if applicable.
- Tests are able to be run using a single command.
