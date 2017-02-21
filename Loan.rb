class Loan
  attr_accessor :interest_rate, :original_balance, :current_balance
  attr_accessor :title, :min_payment, :num_payments

  def initialize args = {}
    @num_payments      = 0
    @interest_rate     = args[:interest_rate]
    @original_balance  = args[:original_balance]
    @current_balance   = args[:current_balance] || @original_balance
    @title             = args[:title]
    @min_payment       = args[:min_payment]
    @num_payments      = args[:num_payments] || 0
  end

  # Pay minimum payment and return the remainder of the payment
  def pay_min(amount)
    return amount if @current_balance <= 0

    @num_payments += 1
    remainders = 0

    if @current_balance < @min_payment
      puts "  Paying $#{@current_balance} for #{title}"
      puts "   ** BOOM! Paid off #{title} on month #{num_payments}"
      remainders = amount - @current_balance
      @current_balance = 0
    else
      puts "  Paying $#{min_payment} for #{title}"
      remainders = amount - @min_payment
      @current_balance -= @min_payment
    end

    return remainders
  end

  # Pay one off payment of certain amount and return remainder
  def pay(amount)
    return amount if @current_balance <= 0
    remainders = 0

    if @current_balance < amount
      puts "  Paying $#{@current_balance} for #{title}"
      puts "   ** BOOM! Paid off #{title} on month #{num_payments}"
      remainders = amount - @current_balance
      @current_balance = 0
    else
      puts "  Paying $#{amount} for #{title}"
      @current_balance -= amount
      remainders = 0
    end

    return remainders
  end
end
