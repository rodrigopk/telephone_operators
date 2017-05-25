#!/usr/bin/env ruby
require_relative 'telephone'

if (ARGV.count == 2)
	number = ARGV[0]
	tel = Telephone.from_csv(ARGV[1])
	lowest_hash = tel.get_smaller_price(number)

	puts("  Lowest rate: $#{lowest_hash.first[1]}")
	puts("  Operator: #{lowest_hash.first[0]}")
else
	puts("Error - Wrong number of arguments.")
	puts("Usage:")
	puts("  ./telephone_exercise.rb [telephone_#] [csv_file_path]")
end