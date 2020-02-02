class Genre 
  attr_accessor :name 
  extend Concerns::Findable
  
  @@all = [] 
  
  def initialize(name, songs=[]) 
    @name = name 
    @songs = songs
    
#    self.save 
  end 
  
  def self.destroy_all 
    @@all = [] 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end
  
  def songs 
    @songs 
  end
  
  def self.create(name)
    Genre.new(name).tap do |genre| 
      genre.save
    end
  end 
  
  def artists 
    artists = [] 
    Song.all.select do |song| 
      song.genre == self 
      artists << song.artist if !artists.include?(song.artist)
    end
     artists
  end
  
end