class PayoffCalculator
  require './Loan'

  attr_accessor :loans, :total_months

  def initialize
    @loans = []
    loan_args = [
      {
        title: "Cody Loans",
        interest_rate: 0.05,
        original_balance: 23000,
        current_balance: 22_500,
        min_payment: 240
      },
      {
        title: "Navient",
        interest_rate: 0.0287,
        original_balance: 9990.58,
        current_balance: 9459.58,
        min_payment: 59
      },
      {
        title: "Aspire",
        interest_rate: 0.0498,
        original_balance: 8942.45,
        current_balance: 7473.45,
        min_payment: 99
      },
      {
        title: "Aspire 2",
        interest_rate: 0.0348,
        original_balance: 7870.42,
        current_balance: 6815.42,
        min_payment: 99
      },
      {
        title: "OSLA",
        interest_rate: 0.042,
        original_balance: 12654.15,
        current_balance: 5295.15,
        min_payment: 286
      },
      {
        title: "Capital One",
        interest_rate: 0.21,
        original_balance: 8000,
        current_balance: 7600,
        min_payment: 350
      },
    ]

    loan_args.each do |args|
      loan = Loan.new(args)
      @loans.push(loan)
    end

    @loans = @loans.sort { |a,b| b.interest_rate <=> a.interest_rate }
    # @loans = @loans.sort { |a,b| a.original_balance <=> b.original_balance }
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

  def current_total
    total = 0
    @loans.each { |l| total += l.current_balance }
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
    month_totals = []

    # looping monthly
    while(total_debt > 0)
      slush = total_payment
      puts; puts "===== MONTH #{@total_months}, current_total: $#{current_total.round(2)} ====="
      month_totals << current_total.round(2)

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
