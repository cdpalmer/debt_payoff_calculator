require "./PayoffCalculator"
require 'pp'

[0, 50,100,150,200,300].each do |extra|
  calculator = PayoffCalculator.new

extra_payments = 300
min_payments = calculator.total_min
puts "Paying $#{min_payments} in minimum payments"
puts "Total debt: $#{calculator.current_total}"
puts "Paying an extra $#{extra_payments} a month"
puts "Totalling $#{min_payments + extra_payments} a month"
calculator.calculate_payoff(min_payments + extra_payments)
