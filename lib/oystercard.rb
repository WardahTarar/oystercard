class Oyster
  attr_accessor :balance
  attr_reader :entry_station

  def initialize
    @balance = 0
    @minimum_fare = 1
    @entry_station = nil
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
    
  def touch_in(station)
    @entry_station = station
    fail 'Minimum balance of £1 required' if minimum_balance?
    # in_journey?
  end

  def touch_out
    @entry_station = nil
    deduct(@minimum_fare)
  end

  def in_journey?
    !@entry_station.nil? 
    # @journey_status
  end

  def minimum_balance?
    @balance < 1
  end

  private

   def deduct(minimum_fare)
    @balance -= @minimum_fare
   end

end