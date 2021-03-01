#!/usr/bin/env ruby
require 'date'
require_relative '../lib/reader.rb'

date = Date.today
puts "Reading file... #{date}"
file = File.new(ARGV.first)
file.spread_file
file.check_trailing_spaces
file.errors_array
if file.errors_array.length == 0
  puts 'No offenses detected'
else
  puts file.errors_array
end
