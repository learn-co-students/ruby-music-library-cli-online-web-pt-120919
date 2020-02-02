require 'concerns.rb'

class Artist

    extend Concerns::Findable 
    @@all = []
    attr_accessor :name 

    def initialize(name)
        @songs = []
        @name= name 
    end
    def genres
        gen =[]
        self.songs.each do |song|
            if !gen.include?(song.genre)
                gen << song.genre
            end
        end
        gen
    end

    def add_song(song)
        if song.artist.nil?
            song.artist = self
        end 
        if !@songs.include?(song)
            @songs << song 
        end

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
        artist = Artist.new(name)
        artist.save
        artist  
    end

end
