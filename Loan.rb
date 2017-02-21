class Loan
  attr_accessor :interest_rate, :original_balance, :current_balance
  attr_accessor :title, :min_payment, :num_payments, :interest_paid

  def initialize args = {}
    @interest_paid     = 0.0
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
      # puts "  Paying $#{@current_balance} for #{title}"
      # puts "   ** BOOM! Paid off #{title} on month #{num_payments}"
      remainders = amount - @current_balance
      @current_balance = 0
    else
      # puts "  Paying $#{min_payment} for #{title}"
      remainders = amount - @min_payment
      @current_balance -= @min_payment
    end

    return remainders
  end

  # Pay one-off payment of certain amount and return remainder
  def pay(amount)
    if @current_balance <= 0 || amount == 0
      return amount
    end

    remainders = 0

    if @current_balance < amount
      # puts "  Paying $#{@current_balance} for #{title}, and paying it off"
      # puts "   ** BOOM! Paid off #{title} on month #{num_payments}"
      remainders = amount - @current_balance
      @current_balance = 0
    else
      # puts "  Paying extra $#{amount} for #{title}"
      @current_balance -= amount
      remainders = 0
    end

    return remainders
  end

  def applied_interest
    (@current_balance * @interest_rate / 12).round(2)
  end

  def apply_interest
    interest = applied_interest
    # puts "  $#{interest} interest charged for #{title}"
    @current_balance += applied_interest
    return interest
  end
end
