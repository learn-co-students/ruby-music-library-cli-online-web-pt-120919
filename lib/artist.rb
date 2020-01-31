class Artist 
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save 
    new_artist 
  end 
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self 
      @songs << song if !@songs.include?(song)
    else 
      @songs << song if !@songs.include?(song)
    end
  end
  
  def genres 
    genres = []
    @songs.each do |song|
      genres << song.genre
    end
    genres.uniq
  end
  
  extend Concerns::Findable
end