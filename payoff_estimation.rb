require "./PayoffCalculator"
require 'pp'

puts "Creating the calculator"
calculator = PayoffCalculator.new

puts "Printing the stats of all loans:"
calculator.print_stats

pmt = 500
puts "Cyclically paying #{pmt}"
calculator.calculate_payoff(pmt)

puts "Total months to payoff"
puts calculator.total_months

