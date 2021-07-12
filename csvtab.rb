#!/usr/bin/ruby2.7
require 'colorize'
require 'tty-table'
require 'csv'

csv_file = ARGV[0]

unless csv_file
  puts 'Usage: csvtab <csv file>'.colorize(:yellow)
  exit!
end

arr_of_rows = CSV.read(csv_file)
table = TTY::Table.new(header: arr_of_rows[0])

data = arr_of_rows.drop(1)

data.each do |row|
  table << row
end

puts table.render(:unicode, resize: true)
