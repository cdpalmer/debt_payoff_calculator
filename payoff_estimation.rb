require "./PayoffCalculator"
require 'pp'

calculator = PayoffCalculator.new

pmt = 5279
puts "Paying $#{pmt} a month"
calculator.calculate_payoff(pmt)

puts; puts "Total months to total debt payoff: #{calculator.total_months}"
calculator.print_stats
