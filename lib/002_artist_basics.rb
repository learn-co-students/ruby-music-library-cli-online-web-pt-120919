class Artist 
  @@all = []
 extend Concerns::Findable
  attr_accessor :name, :song,:genre 
  def initialize(name)
    @name = name
    @@all << self 
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
  def self.create(song)
    song = self.new(song)
    song.save
    song
  end 
  def songs 
    @songs
  end 
  def add_song(song)
    if song.artist == nil 
      song.artist = self 
    else 
      nil 
    end 
    if @songs.include?(song)
      nil 
    else 
      @songs << song 
    end 
    song 
  end 
     def genres
    genres = @songs.collect do |song|
      song.genre
     end
    genres.uniq
    end
end 