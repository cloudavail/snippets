#!/usr/bin/env ruby

require 'erb'

string_with_underscore = "this_is_a_string_with_underscore_characters"
string_with_underscore

string_with_underscore = "this_is_a_string_where_underscore_characters_will_be_replaced"
string_after_erb_substitution = ERB.new("<%= string_with_underscore.gsub!('_', '-') %>")
puts string_after_erb_substitution.result(binding)
