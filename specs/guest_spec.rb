require("minitest/autorun")
require_relative("../guest.rb")


class TestGuest < MiniTest::Test
  def setup
    @guest_1 = Guest.new("Sarah", 50, @song_1)
    @guest_2 = Guest.new("Samuel", 30, @song_2)
    @guest_3 = Guest.new("Mary", 45, @song_3)
    @guest_4 = Guest.new("Isaac", 15, @song_4)
    @guest_5 = Guest.new("Esther", 27, @song_5)

  end

  def test_guest_has_name
    assert_equal("Esther", @guest_5.name)
  end


end
