#!/usr/bin/env ruby

require 'erb'

# test for being defined
var_is_defined = true
var_defined_template = ERB.new("<% if defined? var_is_defined %>var is defined <% end %>")
puts var_defined_template.result(binding)

# test for being defined and true
var_is_defined_and_value_true = true
var_is_defined_and_value_true_template = ERB.new("<% if defined? var_is_defined_and_value_true and var_is_defined_and_value_true == true %>var is defined and true<% end %>")
puts var_is_defined_and_value_true_template.result(binding)

# test for being defined and false
var_is_defined_and_value_false = false
var_is_defined_and_value_false_template = ERB.new("<% if defined? var_is_defined_and_value_false and var_is_defined_and_value_false == true %>var is defined and true<% end %>")
puts var_is_defined_and_value_false_template.result(binding)

# test for _not_ being defined
var_undefined_template = ERB.new("<% if defined? var_is_indefined %>var is defined<% else %>var is undefined<% end %>")
puts var_undefined_template.result(binding)
