class Song

	attr_accessor :name, :artist

	@@all = []

	def initialize(name, artist=nil)
		@name = name
		@artist = artist
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


class Artist

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
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

end
