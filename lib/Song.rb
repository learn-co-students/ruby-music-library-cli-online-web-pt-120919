class Song 
    attr_accessor :name, :artist, :genre
    @@all = []
    #@songs = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end 

    def save
        @@all << self
    end 

    def self.create(name)
        song = self.new(name)
        song.save
        song
    end 

    def self.find_by_name(name)
        self.all.detect {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end 

    def artist=(artist)
        @artist = artist
        self.artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        self.genre.songs << self unless genre.songs.include?(self)
    end

    def self.new_from_filename(filename)
        file_bits = filename.gsub(/(\.mp3)/,'')
        file_bits = file_bits.split(" - ")
        artist = Artist.find_or_create_by_name(file_bits[0])
        genre = Genre.find_or_create_by_name(file_bits[2])
        song = Song.find_or_create_by_name(file_bits[1])
        song.genre = genre
        song.artist = artist
        song
    end

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song.save
    end

    def self.all
        @@all 
    end 

    def self.destroy_all
        @@all.clear
    end

end