# frozen_string_literal: true

require 'tty-prompt'
require_relative 'my_complex'

def get_num(str)
  values = str.split
  r = values[0].chomp.strip.to_f
  c = values[1].chomp.strip.to_f
  MyComplex.new(r, c)
end

puts 'Class for complex numbers with 4 basic arithmetic operations: add, sub, multiply, divide.'
prompt = TTY::Prompt.new
first = get_num(prompt.ask('Enter first complex number @real @imaginary > ', require: true))
second = get_num(prompt.ask('Enter second complex number @real @imaginary > ', require: true))

res = prompt.select('Choose operation: ', per_page: 4) do |menu|
  menu.choice '+'
  menu.choice '-'
  menu.choice '*'
  menu.choice '/'
end

if res == '+'
  puts "Result: #{first.add(second)}"
elsif res == '*'
  puts "Result: #{first.multiply(second)}"
elsif res == '-'
  puts "Result: #{first.sub(second)}"
else
  puts "Result: #{first.divide(second)}"
end
