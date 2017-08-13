require("minitest/autorun")
require_relative("../guest.rb")
require_relative("../Bar.rb")
require_relative("../room.rb")
require_relative("../song.rb")


class TestBar < MiniTest::Test

  def setup
    @bar = Bar.new(20)
    @room_1 = Room.new(3)
    @room_2 = Room.new(7)

    @song_1 = Song.new("Shake It Off", "Taylor Swift")
    @song_2 = Song.new("You Only Live Twice", "Nancy Sinatra")
    @song_3 = Song.new("Strawberry Fields", "The Beatles")
    @song_4 = Song.new("Wannabe", "Spice Girls")
    @song_5 = Song.new("Southside", "Moby")

    @guest_1 = Guest.new("Sarah", 50, @song_1)
    @guest_2 = Guest.new("Samuel", 30, @song_2)
    @guest_3 = Guest.new("Mary", 45, @song_3)
    @guest_4 = Guest.new("Isaac", 15, @song_4)
    @guest_5 = Guest.new("Esther", 27, @song_5)
  end

  def test_has_fee
    assert_equal(20, @bar.fee)
  end

  def test_deduct_fee
    @bar.deduct_fee(@guest_1)
    assert_equal(20, @bar.income)
    assert_equal(30, @guest_1.money)
  end

  def test_add_guest
    @bar.add_guest(@guest_1)
    assert_equal(20, @bar.income)
    assert_equal(30, @guest_1.money)
    assert_equal([@guest_1], @bar.guests)
  end

end
