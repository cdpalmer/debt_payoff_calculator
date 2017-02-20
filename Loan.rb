class Loan
  attr_accessor :interest_rate, :original_balance, :current_balance
  attr_accessor :title, :min_payment, :num_payments

  def initialize args = {}
    @num_payments      = 0
    @interest_rate     = args.fetch(:interest_rate)
    @original_balance  = args.fetch(:original_balance)
    @current_balance   = args.fetch(:current_balance) || @original_balance
    @title             = args.fetch(:title)
    @min_payment       = args.fetch(:min_payment)
    @num_payments      = args.fetch(:num_payments)
  end

  # Pay minimum payment and return the remainder
  def pay_min()
    @num_payments += 1
    return deduct(@min_payment)
  end

  # Pay one off payment of certain amount and return remainder
  def pay(amount)
    return deduct(amount)
  end

private

  def deduct(amount)
    if @current_balance < amount
      @current_balance = 0
      return @current_balance - amount
    else
      @current_balance -= amount
      return 0
    end
  end
end
