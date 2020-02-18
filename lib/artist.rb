class Artist
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end
  
  def self.find_or_create_by_name(artist)
    if self.find(artist)
      self.find(artist)
    else
      self.new(artist)
    end
  end
  
  def self.find(artist)
    self.all.find {|artist| artist.name == artist.name}
  end
  
  def print_songs
    self.songs.each {|song| puts song.name}
  end
  
end