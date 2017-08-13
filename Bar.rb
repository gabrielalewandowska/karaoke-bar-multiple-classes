require_relative("guest.rb")
class Bar

  attr_accessor(:income, :guests, :rooms)
  attr_reader(:fee)
  def initialize(fee)
    @fee = fee
    @rooms = []
    @guests = []
    @income = 0
  end

  def deduct_fee(guest)
    guest.money = guest.money - @fee
    @income = @income + @fee
  end

  def add_guest(guest)
    @guests.push(guest)
    deduct_fee(guest)
  end
end
