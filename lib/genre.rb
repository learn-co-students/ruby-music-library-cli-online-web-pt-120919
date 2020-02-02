require 'concerns.rb'
class Genre
    
    extend Concerns::Findable

    @@all = []
    attr_accessor :name 

    def initialize(name)
        @name = name 
        @songs = []
    end

    def artists
        arts = []
        self.songs.each do |song|
            if !arts.include?(song.artist)
                arts << song.artist 
            end

        end
        arts 
    end

    def songs 
        @songs
    end

    def save
        @@all << self 
    end

    def self.all 
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        genre = Genre.new(name)
        genre.save 
        genre 
    end

end