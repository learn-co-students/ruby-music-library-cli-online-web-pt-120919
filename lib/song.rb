class Song 
  extend Concerns::Findable
  @@all =[]
  attr_accessor :name, :artist, :genre 
  def initialize(name,artist=nil, genre = nil )
    @name=name
    # @@all << self
    self.artist=(artist) if artist != nil 
    self.genre=(genre) if genre != nil 
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
  def artist=(artist)
    if @artist == nil
      @artist = artist
    else
      @artist = @artist
    end
    if self.artist != nil
      @artist.add_song(self)
    end
    @artist
  end
  def artist 
      @artist 
  end
   def genre=(genre)
    if @genre == nil
      @genre = genre
    else
      @genre= @genre
    end
    if self.genre != nil
      @genre.add_song(self)
    end
    @genre

  end
  def genre 
    @genre 
  end 
  
  def songs 
      @songs 
  end 
  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name 
    end 
  end 
  def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
   end 
   def self.new_from_filename(filename)
    split_file = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(split_file[0])
    genre = Genre.find_or_create_by_name(split_file[2])
    self.new(split_file[1], artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
end 