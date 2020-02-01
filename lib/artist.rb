class Artist 
  attr_accessor :name, :songs
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def genres
    self.songs.map {|entry| entry.genre}.uniq
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
  
  def self.create(artist)
    self.new(artist).save
    self.all.find {|entry| entry.name == artist}
  end 
  
  def add_song(song)
    song.artist = self if !song.artist
    self.songs << song if !self.songs.include?(song)
  end 
end 