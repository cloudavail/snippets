README

MemoryProfiler

1. Add the gem 'memory_profiler'
2. Using the convenience api append to code (memory_profiler_example.rb):

require 'memory_profiler'
report = MemoryProfiler.report do
  [run your code here]
end

report.pretty_print

3. OR use the command line (hello.rb):

$ ruby-memory-profiler [options] <script.rb> [--] [script-options]