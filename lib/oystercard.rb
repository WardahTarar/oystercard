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
    @journey_status = true
  end

  def touch_out
    @journey_status = false
  end

  def in_journey?
    @journey_status
  end

end