class Guest

  attr_accessor(:money)
  attr_reader(:name, :favourite_song)

  def initialize(name, money, favourite_song)
    @name = name
    @money = money
    @favourite_song = favourite_song
  end
end
