class Song

	extend Concerns::Findable

	attr_accessor :name, :artist, :genre

	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		self.artist = artist
		self.genre = genre
	end

	def save
		@@all << self
	end

	def artist=(artist)
		@artist = artist
		if artist != nil
			artist.add_song(self)
		end
	end

	def genre=(genre)
		@genre = genre
		if genre != nil
			genre.add_song(self)
		end
	end

	def self.create(name)
		new_obj = new(name)
		new_obj.save
		new_obj
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

end


class Artist

	extend Concerns::Findable

	attr_accessor :name, :songs

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def save
		@@all << self
	end

	def add_song(song)
		if song.artist == nil
			song.artist = self
		end
		if !@songs.include?(song)
			@songs << song
		end
	end

	def genres
		genres = @songs.map do |song|
			song.genre
		end
		genres.uniq
	end

	def self.create(name)
		new_obj = new(name)
		new_obj.save
		new_obj
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

end


class Genre

	extend Concerns::Findable

	attr_accessor :name, :songs

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def save
		@@all << self
	end

	def add_song(song)
		if song.artist == nil
			song.artist = self
		end
		if !@songs.include?(song)
			@songs << song
		end
	end

	def artists
		artists = @songs.map do |song|
			song.artist
		end
		artists.uniq
	end

	def self.create(name)
		new_obj = new(name)
		new_obj.save
		new_obj
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

end
