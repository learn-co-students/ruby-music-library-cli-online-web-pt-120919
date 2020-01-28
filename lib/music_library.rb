class Song

	attr_accessor :name, :artist

	@@all = []

	def initialize(name, artist=nil)
		@name = name
		@artist = artist
		if @artist != nil
			artist = artist
		end
	end

	def save
		@@all << self
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
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

	attr_accessor :name

	@@all = []

	def initialize(name)
		@name = name
	end

	def save
		@@all << self
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
