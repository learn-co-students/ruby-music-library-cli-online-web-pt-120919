class Genre
  
  attr_accessor :name, :artist, :song, :musicimporter, :musiclibrarycontroller
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
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end
  
  def songs
    @songs
  end
  
  def artists
    @array = []
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