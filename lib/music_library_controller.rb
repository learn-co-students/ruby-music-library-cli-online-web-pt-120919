require 'pry'

class MusicLibraryController 
  def initialize(path="./db/mp3s") 
    new_importer = MusicImporter.new(path)
    new_importer.import
  end 
  
  def call 
    response = nil
    while response != "exit"
      puts "Welcome to your music library!" 
      puts "To list all of your songs, enter 'list songs'." 
      puts "To list all of the artists in your library, enter 'list artists'." 
      puts "To list all of the genres in your library, enter 'list genres'." 
      puts "To list all of the songs by a particular artist, enter 'list artist'." 
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'." 
      puts "To quit, type 'exit'." 
      puts "What would you like to do?" 
      
      response = gets.chomp 
      
      if response == 'list songs' 
        self.list_songs 
      elsif response == 'list artists' 
        self.list_artists 
      elsif response == 'list genres' 
        self.list_genres 
      elsif response == 'list artist' 
        self.list_songs_by_artist 
      elsif response == 'list genre' 
        self.list_songs_by_genre 
      elsif response == 'play song'
        self.play_song
      end
    end
  end 
  
  def list_songs 
=begin
    new_array = Song.all.sort_by { |song| song.name }
    new_array.each_with_index do |song, index| 
      puts "#{index + 1}. #{song.artist.name} - #{song.name.split(' ').map(&:capitalize).join(' ')} - #{song.genre.name}" 
    end 
    new_array 
=end 

    Song.all.sort_by(&:name).each.with_index(1) do |song, index| 
      
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
    end
  end 
  
  
  def list_artists 
    artist_array = Artist.all.sort_by { |artist| artist.name } 
    
    artist_array.each_with_index do |artist, index| 
      puts "#{index + 1}. #{artist.name}" 
    end 
    artist_array
  end 
  
  def list_genres 
    
    genre_array = Genre.all.sort_by { |genre| genre.name } 
    genre_array.each.with_index(1) do |genre, index| 
      puts "#{index}. #{genre.name}" 
    end 
    genre_array 
  end 
  
  def list_songs_by_artist 
    puts "Please enter the name of an artist:"
    artist_to_find = gets.chomp 
    if artist = Artist.find_by_name(artist_to_find) 
      artist_songs_list = artist.songs.sort_by do |song| 
        song.name 
      end 
      artist_songs_list.each.with_index(1) do |song, index| 
        puts "#{index}. #{song.name} - #{song.genre.name}" 
      end
    end 
   end 
   
  def list_songs_by_genre 
    puts "Please enter the name of a genre:" 
    song_genre = gets.chomp 
    if genre = Genre.find_by_name(song_genre) 
      all_genre_songs = genre.songs.sort_by do |genre| 
        genre.name 
      end 
      all_genre_songs.each.with_index(1) do |genre, index| 
        puts "#{index}. #{genre.artist.name} - #{genre.name}" 
      end
    end
  end 
=begin
  def play_song 
    list_songs
    puts "Which song number would you like to play?"
    song_number = gets.chomp.to_i 
    if song_number >= 1 && song_number <= Song.all.length
      songs = Song.all.sort_by { |song| song.name } 
      song = songs[song_number_index + 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end 
=end 
def play_song
    puts "Which song number would you like to play?"
    list_of_songs = Song.all.sort_by { |song| song.name }
    song_number = gets.chomp.to_i
    if (song_number >= 1) && (song_number <= list_of_songs.size)
      song = list_of_songs[song_number - 1]
      puts "Playing #{song.name} by #{song.artist.name}" if song
    end
  end
   
end