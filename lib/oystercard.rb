class Oystercard
  attr_reader :balance, :limit, :min

  DEFAULT_BALANCE = 0

  DEFAULT_LIMIT = 9000
  DEFAULT_MIN = 1

  def initialize(balance = DEFAULT_BALANCE, limit = DEFAULT_LIMIT, min = DEFAULT_MIN)
    @in_journey = false
    @balance = balance
    @limit = limit
    @min = min
  end

  def top_up(amount)
    fail("Cannot top up more than £#{limit / 100}") if (@balance + amount) > @limit
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    return @in_journey
  end

  def touch_in
    fail("Balance too low") if @balance < @min
    @in_journey = true
  end

  def touch_out
    fail("Not in journey") if @in_journey == false
    @in_journey = false
  end
end
