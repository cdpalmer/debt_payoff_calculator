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
        interest_rate: 0.095,
        original_balance: 12000,
        current_balance: 12000,
        min_payment: 250
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

    # @loans = @loans.sort { |a,b| b.interest_rate <=> a.interest_rate }
    @loans = @loans.sort { |a,b| a.original_balance <=> b.original_balance }
  end

  def print_stats
    puts "Total starting debt: #{starting_debt}"
    puts

    @loans.each do |l|
      puts "#{l.title}: "
      puts "  Original balance: $#{l.original_balance.round(2)}"
      # puts "  Current balance:  $#{l.current_balance.round(2)}"
      puts "  Minimum payment:  $#{l.min_payment.round(2)}"
      puts "  Interest paid:    $#{l.interest_paid.round(2)}"
      puts "  Interest rate:    #{(l.interest_rate * 100).round(2)}%"
      puts "  Paid off at:      #{l.num_payments.round(2)} months"
      puts;puts;
    end
  end

  def total_debt
    total = 0
    @loans.each { |l| total += l.current_balance }
    total
  end

  def total_min
    total = 0
    @loans.each { |l| total += l.min_payment }
    total
  end

  def starting_debt
    total = 0
    @loans.each { |l| total += l.original_balance }
    total
  end

  def calculate_payoff(total_payment)
    total_min = 0
    @loans.each { |l| total_min += l.min_payment }
    if total_min > total_payment
      puts "-- WARNING -- Your total payment does not meet min payments"
      puts "   You need at least $#{total_min}"
      return
    end

    @total_months = 1

    # looping monthly
    while(total_debt > 0)
      slush = total_payment
      # puts; puts; puts "===== MONTH #{@total_months}, total minimum: $#{total_min} ====="

      # make min payments
      @loans.each do |l|
        if l.current_balance > 0
          l.interest_paid += l.apply_interest
          slush = l.pay_min(slush)
        end
      end

      # puts "  Leftover after minimums: $#{slush}"
      while(slush > 0 && total_debt > 0)
        @loans.each do |l|
          slush = l.pay(slush) unless l.current_balance == 0
        end
      end

      @total_months += 1 if total_debt > 0
    end
  end
end
