#!/usr/bin/env ruby
array = Array.new
i = 0
loop do
	array << i
	i = i + 1
	sleep(1)
	puts array
	if i == 300
		break
	end
end