class PayoffCalculator
  require './Loan'

  attr_accessor :loans, :total_months

  def initialize
    @loans = []
    loan_args = [
      {
        title: "Aspire",
        interest_rate: 0.065,
        original_balance: 10000,
        current_balance: 10000,
        min_payment: 200
      },
      {
        title: "Navient",
        interest_rate: 0.045,
        original_balance: 12000,
        current_balance: 12000,
        min_payment: 275
      }
    ]

    loan_args.each do |args|
      loan = Loan.new(args)
      @loans.push(loan)
    end
  end

  def print_stats
    puts "Total debt: #{total_debt}"
    puts

    @loans.each do |l|
      puts "#{l.title}: "
      puts "  Original balance: #{l.original_balance}"
      puts "  Current balance:  #{l.current_balance}"
      puts "  Interest rate:    #{l.interest_rate}"
      puts "  Minimum payment:  #{l.min_payment}"
      puts;puts;
    end
  end

  def total_debt
    total = 0
    @loans.each { |l| total += l.current_balance }
    total
  end

  def calculate_payoff(total_payment)
    total_months = 0
    max_loan = @loans.first
    @total_months = 0

    # looping monthly
    while(total_debt > 0)
      slush = total_payment
      @loans.each do |l|
        slush = l.pay_min(slush)
      end

      puts "  leftover cash this month: #{slush}"
      @total_months += 1
    end
  end
end
