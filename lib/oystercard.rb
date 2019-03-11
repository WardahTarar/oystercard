class Oyster
  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    limit = 90
    @balance += amount
    if @balance > 90
      fail 'Max limit £90'
    else 
      @balance
    end
  end

  def deduct(fare)
    @balance -= fare
  end
    
  def touch_in
  end

  def touch_out
  end

  def in_journey?
  end

end