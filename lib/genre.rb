class Genre
  extend Concerns::Findable
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end  
  
  def self.all
    @@all
  end  
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    self.class.all << self
  end
  
  def self.create(name)
    self.new(name).tap do|genre|
      genre.save
    end
  end
  
  def songs
    @songs
  end  
  
  def artists
    self.songs.collect {|s| s.artist}.uniq
  end  
  
end  