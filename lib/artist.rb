class Artist

  attr_accessor :name
  # variable to track all saved artists
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song_object)
    @songs << song_object
  end

  def songs
    @songs
  end

  def save
    # stores artist instance in @@all array
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
     artist = @@all.find {|artist| artist.name == name}
     if artist
       return artist
     else
       artist = Artist.new(name)
       @@all << artist
       artist
     end
  end

  def print_songs
    # binding.pry
    @songs.each do |song|
    puts song.name
    end
  end

end
