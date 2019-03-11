class Oyster
  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    limit = 90
    new_balance = @balance += amount
    if new_balance > 90
      fail 'Max limit £90'
    else 
      new_balance
    end
  end

end