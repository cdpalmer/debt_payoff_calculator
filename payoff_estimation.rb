require "./PayoffCalculator"
require 'pp'

[0, 50,100,150,200,300].each do |extra|
  calculator = PayoffCalculator.new

  extra_payments = extra
  min_payments = calculator.total_min
  puts "Paying $#{min_payments.round(2)} in minimum payments"
  puts "Paying an extra $#{extra_payments.round(2)} a month"
  puts "Totaling $#{(min_payments + extra_payments).round(2)} a month"
  calculator.calculate_payoff(min_payments + extra_payments)

  puts; puts "Total months to total debt payoff: #{calculator.total_months} (#{(calculator.total_months/12.0).round(2)} years)"
  calculator.print_stats


  puts '== == '*10
end

