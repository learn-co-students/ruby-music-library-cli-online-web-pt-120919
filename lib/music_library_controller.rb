require 'pry'
class MusicLibraryController 
  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end
  
  def call 
    puts "Welcome to your music library!"
    input = ""
    until input == "exit"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.chomp
      
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
      
    end
  end
  
  def list_songs 
    count = 1
    Song.all.uniq.sort_by { |song| song.name }.each do |song|
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      count += 1
    end
  end
  
  def list_artists 
    count = 1
    Artist.all.uniq.sort_by { |artist| artist.name }.each do |artist|
      puts "#{count}. #{artist.name}"
      count += 1
    end
  end
  
  def list_genres 
    count = 1
    Genre.all.uniq.sort_by { |genre| genre.name }.each do |genre|
      puts "#{count}. #{genre.name}"
      count += 1
    end
  end
  
  def list_songs_by_artist 
    puts "Please enter the name of an artist:"
    input = gets.chomp 
    count = 1
    if Artist.find_by_name(input)
      Artist.find_by_name(input).songs.sort_by {|song| song.name}.each do |song|
        puts "#{count}. #{song.name} - #{song.genre.name}"
        count += 1 
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp 
    count = 1
    if Genre.find_by_name(input)
      Genre.find_by_name(input).songs.sort_by {|song| song.name}.each do |song|
        puts "#{count}. #{song.artist.name} - #{song.name}"
        count += 1 
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    #list_songs
    songs_list = Song.all.uniq.sort_by {|song| song.name}
    input = gets.chomp.to_i
    if input > 0 and input <= songs_list.size
      song = songs_list[input - 1 ]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end