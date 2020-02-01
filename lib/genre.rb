class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def artists
    self.songs.map {|entry| entry.artist}.uniq 
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
  
  def self.create(genre)
    self.new(genre).save
    self.all.find {|entry| entry.name == genre}
  end 
end 