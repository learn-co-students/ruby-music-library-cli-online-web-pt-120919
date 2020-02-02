class MusicLibraryController

    def initialize(path_name= "./db/mp3s")
        @path = path_name
        files = MusicImporter.new(path_name)
        @library = files.import 
    end

    def call
        
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        arg =""
        while arg != "exit" do 
            puts "What would you like to do?"
            arg = gets.chomp

            case arg 
            when "list songs"
                list_songs
            when 'list artists'
                list_artists
            when 'list genres'
                list_genres
            when 'list artist'
                list_songs_by_artist
            when 'list genre'
                list_songs_by_genre
            when 'play song'
                play_song
            end

        end
    
    end

    
    def list_songs
        Song.all.sort_by{|song| song.name}.each_with_index do |song, index|
            puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        Artist.all.sort{|a, b| a.name <=> b.name}.each.with_index do |artist, index|
            puts "#{index + 1}. #{artist.name}"
        end
    end

    def list_genres
        Genre.all.sort_by{|genre| genre.name}.each_with_index do |genre, index|
            puts "#{index + 1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_name = gets.chomp
        Song.all.select{|song| song.artist.name == artist_name}.sort_by{|song| song.name}.each_with_index do |song, index|
           puts "#{index + 1}. #{song.name} - #{song.genre.name}" 
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_name = gets.chomp 
        Song.all.select{|song| song.genre.name == genre_name}.sort_by{|song| song.name}.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name}" 
        end
    end

    def play_song
        song_number = 0
        puts "Which song number would you like to play?"
        song_number = gets.chomp.to_i
        Song.all.sort_by{|song| song.name}.each_with_index do |song, index|
            if (index + 1)==song_number
                puts "Playing #{song.name} by #{song.artist.name}"
            end            
        end
    end
end
