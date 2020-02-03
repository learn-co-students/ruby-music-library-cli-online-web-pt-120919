class Song 
  
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=artist if artist
    self.genre=genre if genre
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self unless @@all.include?(self)
  end
  
  def self.create(song, artist=nil, genre=nil)
    song = self.new(song, artist, genre)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  #def artist=(artist)
		#artist.name = @name
		#artist.add_song(@@all)
		#if artist == nil
			#@artist = artist
		#elsif artist != nil
			#@artist = artist
			#artist.add_song(self)
		#end
	#end 
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

end