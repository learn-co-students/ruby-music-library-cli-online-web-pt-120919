require 'pry'

class Song 
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil 
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
    new_song = Song.new(name) 
    new_song.save 
    new_song 
  end
  
  def artist=(artist)
    if @artist == nil
      @artist = artist 
    end
    if self.artist != nil
      @artist.add_song(self)
    end
  end
  
  def genre=(genre)
    if @genre == nil 
      @genre = genre 
    end 
    if self.genre != nil 
      genre.songs << self if !genre.songs.include?(self)
    end
  end
  
  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) 
      return self.find_by_name(name) 
    else 
      self.create(name) 
    end
  end
  
  def self.new_from_filename(filename)
    song_details = filename.chomp(".mp3").split(" - ")
    
    new_song = Song.find_or_create_by_name(song_details[1])
    new_song.artist = Artist.find_or_create_by_name(song_details[0])
    new_song.genre = Genre.find_or_create_by_name(song_details[2])
    
    new_song
  end
  
  def self.create_from_filename(filename)
    new_song = Song.new_from_filename(filename)
    new_song.save
  end
  
end 