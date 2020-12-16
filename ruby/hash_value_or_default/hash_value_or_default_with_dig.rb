#!/usr/bin/env ruby

record = { attrs: { container_name: "stdout" } }
record_no_attrs = {}
record_no_contrainer_name = { attrs: {} }

puts record.dig(:attrs)
puts record.dig(:attrs, :container_name)
puts record_no_attrs.dig(:attrs, :container_name) || "Not Defined"
puts record_no_contrainer_name.dig(:attrs, :container_name) || "Not Defined"
