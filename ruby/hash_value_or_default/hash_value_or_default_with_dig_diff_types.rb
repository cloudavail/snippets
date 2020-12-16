#!/usr/bin/env ruby

record = { 'attrs' => nil }
record['attrs'] = { 'container_name' => 'container' }
puts record.dig(:attrs, :container_name) || "Not Defined"
puts record.dig('attrs', 'container_name') || "Not Defined"
