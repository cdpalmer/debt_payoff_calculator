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
        current_balance: 250,
        min_payment: 100
      },
      {
        title: "Navient",
        interest_rate: 0.095,
        original_balance: 12000,
        current_balance: 350,
        min_payment: 100
      },
      {
        title: "Flagstar",
        interest_rate: 0.03825,
        original_balance: 200000,
        current_balance: 200000,
        min_payment: 1600
      }
    ]

    loan_args.each do |args|
      loan = Loan.new(args)
      @loans.push(loan)
    end

    @loans = @loans.sort { |a,b| b.interest_rate <=> a.interest_rate }
  end

  def print_stats
    puts "Total debt: #{total_debt}"
    puts

    @loans.each do |l|
      puts "#{l.title}: "
      puts "  Original balance: $#{l.original_balance}"
      puts "  Current balance:  $#{l.current_balance}"
      puts "  Interest rate:    #{l.interest_rate}%"
      puts "  Minimum payment:  $#{l.min_payment}"
      puts;puts;
    end
  end

  def total_debt
    total = 0
    @loans.each { |l| total += l.current_balance }
    total
  end

  def calculate_payoff(total_payment)
    @total_months = 1

    # looping monthly
    while(total_debt > 0)
      slush = total_payment

      puts; puts; puts "===== MONTH #{@total_months} ====="

      # make min payments
      @loans.each do |l|
        slush = l.pay_min(slush)
      end

      puts "  Month #{@total_months} extra: $#{slush}"
      while(slush > 0 && total_debt > 0)
        @loans.each do |l|
          slush = l.pay(slush)
        end
      end

      @total_months += 1 if total_debt > 0
    end
  end
end
