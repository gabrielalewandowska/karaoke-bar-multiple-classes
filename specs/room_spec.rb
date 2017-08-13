require("minitest/autorun")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")
require("pry")


class TestRoom < MiniTest::Test
  def setup
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

  # def test_number_of_rooms
  #   assert_equal(2, Room.number_of_rooms)
  # end

  def test_room_has_capacity
    assert_equal(3, @room_1.capacity)
  end

  def test_check_in
    @room_1.check_in(@guest_1)
    @room_1.check_in(@guest_2)
    assert_equal([@guest_1, @guest_2], @room_1.guests)
  end

  def test_check_out
    @room_1.check_in(@guest_1)
    @room_1.check_in(@guest_2)
    @room_1.check_out(@guest_1)
    assert_equal([@guest_2], @room_1.guests)
  end

  def test_add_song
    @room_1.add_song(@song_5)
    @room_1.add_song(@song_4)
    added_songs = [@song_5, @song_4]
    assert_equal(added_songs, @room_1.songs)
  end

  def test_room_is_full
    @room_1.check_in(@guest_1)
    @room_1.check_in(@guest_2)
    @room_1.check_in(@guest_3)
    @room_1.check_in(@guest_4)
    assert_equal(3, @room_1.guests.count)
  end

  def test_check_if_favourite_song_negative
    @room_1.check_in(@guest_3)
    @room_1.add_song(@song_1)
    @room_1.add_song(@song_2)
    assert_equal(":(", @room_1.check_if_favourite_song(@guest_3))
  end

  def test_check_if_favourite_song_positive
    @room_1.check_in(@guest_3)
    @room_1.add_song(@song_1)
    @room_1.add_song(@song_2)
    @room_1.add_song(@song_3)
    assert_equal("Yay!", @room_1.check_if_favourite_song(@guest_3))
  end
end
