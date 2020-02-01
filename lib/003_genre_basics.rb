class Genre 
  extend Concerns::Findable
    @@all = []
  attr_accessor :name 
  def initialize(name)
    @name = name
    @songs = []
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
  def songs 
    @songs 
  end 
  def self.create(song)
    song = self.new(song)
    song.save
    song
  end 
   def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end
   def artists
    @new_array = []
    @songs.each do |song|
      if @new_array.include?(song.artist)
        nil
      else
        @new_array << song.artist
      end
    end
    @new_array
  end
end 