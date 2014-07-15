#!/usr/bin/env ruby

# objective:
# find a cross-platform (Windows/Linux/OS X) method of locating executables
# for example, I want to determine if an executable 'ngrok' is installed

require 'mkmf'
null_file = File.open(File::NULL, "w")
MakeMakefile::Logging.logfile(null_file)
MakeMakefile::find_executable('cd')
MakeMakefile::find_executable('ngrok')
MakeMakefile::find_executable('notfound')
