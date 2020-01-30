class Artist
  attr_accessor :name, :song
  @@all = []
  
  def initialize(name)
    @songs = []
    @name = name
    @@all << self
    
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
    @self = name
    @@all << @self
    @self
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    unless song.artist == self
    song.artist = self
    @songs << song
  end
    
  end 

end