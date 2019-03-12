class Oyster
  attr_accessor :balance, :journey_history
  attr_reader :entry_station, :exit_station

  def initialize
    @journey_history = []
    @balance = 0
    @minimum_fare = 1
    @entry_station = nil
    @exit_station = nil
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

  def touch_out(station)
    @exit_station = station
    deduct(@minimum_fare)
    # @journey_history << {entry: @entry_station, exit: @exit_station}
    # @journey_history
  end

  def in_journey?
    !@entry_station.nil? 
    # @journey_status
  end

  def minimum_balance?
    @balance < 1
  end

  def adding_journey
    @journey_history << {entry: @entry_station, exit: @exit_station}
  end

  private

  def deduct(minimum_fare)
    @balance -= @minimum_fare
  end

  end