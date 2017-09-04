require "./PayoffCalculator"
require 'pp'

calculator = PayoffCalculator.new

extra_payments = 1400
min_payments = calculator.total_min
puts "Paying $#{min_payments} in minimum payments"
puts "Paying an extra $#{extra_payments} a month"
puts "Totalling $#{min_payments + extra_payments} a month"
calculator.calculate_payoff(min_payments + extra_payments)

puts; puts "Total months to total debt payoff: #{calculator.total_months} (#{(calculator.total_months/12.0).round(2)} years)"
calculator.print_stats
