#!/usr/bin/env ruby

require 'erb'

# test if defined
memory_limit_defined = "2Gi"
var_defined_template = ERB.new("<%= defined?(memory_limit_defined) ? memory_limit_defined : '1Gi' %>")
puts var_defined_template.result(binding)

# test for being defined
#memory_limit_undefined = "2Gi"
var_undefined_template = ERB.new("<%= defined?(memory_limit_undefined) ? memory_limit_undefined : '1Gi' %>")
puts var_undefined_template.result(binding)
