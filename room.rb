class Room

  @@number_of_rooms = 0

  def self.number_of_rooms
    return @@number_of_rooms
  end

  attr_reader(:capacity, :guests, :songs)

  def initialize(capacity)
    @capacity = capacity
    @guests = []
    @songs = []
    @@number_of_rooms += 1
  end

  def check_if_favourite_song(guest)
    for song in @songs
      return "Yay!" if song == guest.favourite_song
    end
    for song in @songs
      return ":(" if song != guest.favourite_song
    end
  end

  def check_in(guest)
    if @guests.count >= @capacity
      puts "Unfortunately this room is already full!"
    else
      @guests.push(guest)
    end
  end

  def check_out(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs.push(song)
  end

end
