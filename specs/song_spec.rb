require("minitest/autorun")
require_relative("../song.rb")

class TestSong < MiniTest::Test
  def setup
    @song_1 = Song.new("Shake It Off", "Taylor Swift")
    @song_2 = Song.new("You Only Live Twice", "Nancy Sinatra")
    @song_3 = Song.new("Strawberry Fields", "The Beatles")
    @song_4 = Song.new("Wannabe", "Spice Girls")
    @song_5 = Song.new("Southside", "Moby")

    songs = [@song_1,@song_2, @song_3, @song_4, @song_5]

  end

  def test_song_has_name
    assert_equal("Wannabe",@song_4.name)
  end
end
