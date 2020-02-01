class Song 
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.genre=(genre) if genre
    self.artist=(artist) if artist
  end
  
  def self.find_by_name(name)
    self.all.find {|entry| entry.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end
  
  def self.new_from_filename(file_name)
    file = file_name.split(" - ")
    song_name = file[1]
    artist = Artist.find_or_create_by_name(file[0])
    genre = Genre.find_or_create_by_name(file[2].gsub(".mp3", ""))
    self.new(song_name, artist, genre)
  end
  
  def save
    @@all << self 
  end
  
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
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
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(song)
    self.new(song).save
    self.all.find {|entry| entry.name == song}
  end 
end 