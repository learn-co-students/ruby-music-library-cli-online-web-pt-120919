require 'pry'

class Song 
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable
  
  @@all = [] 
  
  def initialize(name, artist=nil, genre=nil) 
    @name = name 
    self.artist=(artist) if artist
    self.genre=(genre) if genre
    self.save if artist && genre
#    @artist.add_song(self)
  end 
  
  def save 
    @@all << self
  end 
  
  def self.destroy_all 
    @@all = []
  end 
  
  def artist=(artist)
    @artist = artist 
    @artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre 
    @genre.songs << self if !@genre.songs.include?(self)
  end
  
  def self.all 
    @@all 
  end 
  
  def self.create(name) 
=begin 
    song = Song.new(name) 
    song.save 
    song 
=end   
  #fix sandwich code above with tap method
    Song.new(name).tap do |song|
      song.save
    end
  end 
=begin  
  def self.find_by_name(name) 
    Song.all.find {|song| song.name == name }
  end  
=end

  def self.find_or_create_by_name(name) 
  
    if self.find_by_name(name)
      self.find_by_name(name) 
    else
      new_song = Song.create(name) 
      
    end 
  end 
  
  def self.new_from_filename(file) 
    new_file = file.split(" - ") 
    new_artist = new_file[0]
    new_song = new_file[1]
    new_genre = new_file[2].gsub(".mp3", "") 
    song = self.find_or_create_by_name(new_song) 
    song.artist = Artist.find_or_create_by_name(new_artist)
    song.genre = Genre.find_or_create_by_name(new_genre)
    song
  end 
  
  def self.create_from_filename(file) 
    new_file = self.new_from_filename(file) 
#   @@all << new_file
  end

end 


