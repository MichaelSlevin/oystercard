require './lib/oystercard.rb'

oystercard = Oystercard.new

oystercard.balance

oystercard.top_up(2000)

oystercard.deduct(1000)

oystercard.in_journey?

oystercard.touch_in

oystercard.touch_out
