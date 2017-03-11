require "./PayoffCalculator"
require 'pp'

calculator = PayoffCalculator.new

pmt = 5279
puts "Paying $#{pmt} a month"
calculator.calculate_payoff(pmt)

puts; puts "Total months to total debt payoff: #{calculator.total_months} (#{(calculator.total_months/12.0).round(2)} years)"
calculator.print_stats
