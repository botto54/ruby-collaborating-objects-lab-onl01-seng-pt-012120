class Song
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def artist_name=(artist)
    if artist.class == Artist
      @artist = artist
    else
      @artist = Artist.find_or_create_by_name(artist)
    end
  end
  
  def self.new_by_filename(name)
    split_name = name.split(" - ")
    song = self.new(split_name[1])
    song.artist_name = split_name[0]
    song
  end
  
end