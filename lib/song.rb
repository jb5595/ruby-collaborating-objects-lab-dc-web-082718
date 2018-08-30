class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    # parses file name info into constituent part
    song_info = filename.split(" - ")
    song_name = song_info[1]
    artist_name = song_info[0]
    genre = song_info[2].chomp(".mp3")
    # creates new song object from song name
    song = Song.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.artist.add_song(song_name)
    song
  end


end
