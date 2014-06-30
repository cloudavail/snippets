#!/usr/bin/env ruby

require 'yaml'

valid_yaml = './valid_yaml_file.yaml'
invalid_yaml = './invalid_yaml_file.yaml'

begin
  YAML.load_file(valid_yaml)
rescue
  $stderr.print("Failed to Load #{valid_yaml}.\n")
  exit 1
end

begin
  YAML.load_file(invalid_yaml)
rescue StandardError => error
  $stderr.print("Failed to Load #{invalid_yaml}.\n")
  $stderr.print("#{error}.\n")
  exit 1
end