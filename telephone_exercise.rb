#!/usr/bin/env ruby
require_relative 'telephone'

#'C:\Users\rodrigo.vasconcelos\data.csv'
# '4673212345'
number = ARGV[0]
tel = Telephone.new(ARGV[1])
lowest_hash = tel.get_smaller_price(number)

puts("  Lowest rate: $#{lowest_hash.first[1]}")
puts("  Operator: #{lowest_hash.first[0]}")