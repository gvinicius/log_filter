require_relative 'operator'

DEFAULT_SEPARATOR = ' '
filename = ARGV[0]

puts 'Reading a log file'
operator = Operator.new(filename, DEFAULT_SEPARATOR)

puts 'Most viewed pages'
operator.tabulate.map { |element| puts "#{element.keys.first} - #{element.values.first}" }

puts 'Most viewed pages (unique accesses)'
operator.tabulate_unique.map { |element| puts "#{element.keys.first} - #{element.values.first}" }

puts 'Most viewed pages (avarage accesses)'
operator.average.map { |element| puts "#{element.keys.first} - #{element.values.first}" }
