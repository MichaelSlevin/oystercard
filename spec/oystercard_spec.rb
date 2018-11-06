require "oystercard"

describe Oystercard do
  it "has a #balance" do
    expect(subject.balance).to equal(0)
  end
  it "can #top_up a card" do
    subject.top_up(1000)
    expect(subject.balance).to eq(1000)
  end
  it "error raised if #top_ip more than limit " do
    expect{ subject.top_up(9001) }.to raise_error("Cannot top up more than £90")
  end
  it "#deduct(amount) decreases the balance by amount" do
    subject.top_up(1000)
    subject.deduct(500)
    expect(subject.balance).to eq(500)
  end

  it "new card not #in_journey?" do
    expect(subject.in_journey?).to eq(false)
  end

  it "#touch_in changes in_journey? to true" do
    subject.top_up(1000)
    subject.touch_in
    expect(subject.in_journey?).to eq(true)
  end

  it "#touch_put changes in_journey? to false" do
    subject.top_up(1000)
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey?).to eq(false)
  end

  it "#touch_put changes in_journey? to false" do
    expect{ subject.touch_out }.to raise_error("Not in journey")
  end

  it "error raised if #touch_in with less than £1" do
    expect { subject.touch_in }.to raise_error("Balance too low")
  end


end
