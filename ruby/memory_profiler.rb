require 'memory_profiler'
report = MemoryProfiler.report do
	puts 'something'
	puts 500000000000000000000
end
report.pretty_print