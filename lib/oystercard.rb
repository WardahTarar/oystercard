class Oyster
  attr_accessor :balance

  def initialize
    @balance = 0
    @minimum_fare = 1
  end

  def top_up(amount)
    limit = 90
    total = @balance + amount
    if total > limit
      fail 'Max limit £90'
    else 
      @balance += amount
    end
  end
    
  def touch_in
    fail 'Minimum balance of £1 required' if minimum_balance?
    @journey_status = true
  end

  def touch_out
    @journey_status = false
    deduct(@minimum_fare)
  end

  def in_journey?
    @journey_status
  end

  def minimum_balance?
    @balance < 1
  end

  private

   def deduct(minimum_fare)
    @balance -= @minimum_fare
   end

end