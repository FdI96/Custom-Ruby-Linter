#!/usr/bin/env ruby
require 'date'
require_relative '../lib/reader.rb'

date = Date.today

file = File.new(ARGV.first)
puts "Reading file: #{file.path}... #{date}"
file.spread_file
file.check_trailing_spaces
file.check_wrong_identation
file.check_line_length
if file.errors_array.length == 0
  puts 'No offenses detected'
else
  puts file.errors_array
end
