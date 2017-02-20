class PayoffCalculator
  require './Loan'

  attr_accessor :loans

  def init
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
        title: "Aspire",
        interest_rate: 0.065,
        original_balance: 10000,
        current_balance: 10000,
        min_payment: 200
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
end
