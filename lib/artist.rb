class Artist 
  attr_accessor :name, :songs
  extend Concerns::Findable 
  
  @@all = [] 
  
  def initialize(name, songs=[]) 
    @name = name 
    @songs = songs
#    self.save
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all 
    @@all = [] 
  end 
  
  def save 
    @@all << self 
  end 
  
  def songs 
    @songs
  end
  
  def self.create(name) 
=begin 
    artist = Artist.new(name) 
    artist.name = name 
    artist 
=end 
  #fix sandwich code above with tap method 
  
    Artist.new(name).tap do |artist| 
      artist.save 
    end
  end 
  
  def add_song(song) 
    song.artist = self unless song.artist
    @songs << song if !songs.include?(song)
  end
  
  def genres 
    genres = []
    Song.all.select do |song| 
      song.artist == self  
      genres << song.genre if !genres.include?(song.genre)
    end 
    genres
  end
end