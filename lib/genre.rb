class Genre
  attr_accessor :name, :musiclibrarycontroller, :musicimporter 
  extend Concerns::Findable 
  @@all = []
  def initialize(name)
    @name = name 
    @songs = []
   end
def self.all 
  @@all 
end 

def self.destroy_all 
  self.all.clear
end

def save 
  @@all << self 
end 

def self.create(name)
   self.new(name).tap do |genre|
    genre.save
end
end
def songs 
  @songs 
end 
def add_song(song)
  song.genre = self unless song.genre == self 
  @songs << song unless @songs.include?(song)
end
def artists 
  @array= []
  
  @songs.each do |song|
    if @array.include?(song.artist)
      nil 
    else 
      @array << song.artist 
    end 
  end  
  @array 
end 



end