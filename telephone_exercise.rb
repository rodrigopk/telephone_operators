#!/usr/bin/env ruby
require_relative 'telephone'

number = ARGV[0]
tel = Telephone.from_csv(ARGV[1])
lowest_hash = tel.get_smaller_price(number)

puts("  Lowest rate: $#{lowest_hash.first[1]}")
puts("  Operator: #{lowest_hash.first[0]}")