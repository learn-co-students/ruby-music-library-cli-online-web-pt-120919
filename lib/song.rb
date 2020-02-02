require 'pry'
require 'concerns.rb'
class Song
    @@all = []
    attr_accessor :name 
    attr_reader :artist, :genre 
    extend Concerns::Findable

    def initialize(name, artist_name = nil, genre_name = nil)
        if !artist_name.nil? 
            self.artist= artist_name
        end
        if !genre_name.nil?
            self.genre= genre_name
        end
        @name = name 
        artist

    end

    def genre=(genre_name)
        @genre = genre_name
        if !genre_name.songs.include?(self)
          genre_name.songs << self
        end
    end


    def artist=(artist_name)
        #binding.pry
        @artist = artist_name
        #artist_name.save 
        artist_name.add_song(self)
        #artist_name
    end

    #def self.find_by_name(name)
    #    self.all.find{|song| song.name == name}
    #end

    #def self.find_or_create_by_name(name)
    #    if self.find_by_name(name).nil?
    #        self.create(name)
    #    else
    #        self.find_by_name(name)
    #    end
    #end

    def self.new_from_filename(file_name)
       info = file_name.split(" - ")
       name = info[1]
       art = Artist.find_or_create_by_name(info[0])
       genre = Genre.find_or_create_by_name(info[2].split(".")[0])
       if self.find_by_name(name).nil?
          song = Song.new(name, art, genre)
       else
          self.find_by_name(name)
       end

    end

    def self.create_from_filename(name)
       new_song = self.new_from_filename(name)
       new_song.save 
       new_song
    end


    def self.all 
        @@all
    end

    def save
        @@all << self 
    end
    
    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        new_song = Song.new(name)
        new_song.save 
        new_song
    end


end
