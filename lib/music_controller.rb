class MusicLibraryController
  
  def initialize(mp3_path='./db/mp3s')
    MusicImporter.new(mp3_path).import
  end
  
  def call 
    input = nil
    until input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip
      
      case input
        when 'list songs'
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
      songs = Song.all.sort_by {|song| song.name}
      songs.each_with_index do |song, index|
      puts "#{index += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end
  
  def list_artists
      artists = Artist.all.sort_by {|artist| artist.name}
      artists.each_with_index do |artist, index|
      puts "#{index += 1}. #{artist.name}"
    end 
  end
  
  def list_genres
      genres = Genre.all.sort_by {|genre| genre.name}
      genres.each_with_index do |genre, index|
      puts "#{index += 1}. #{genre.name}"
    end 
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    artist_library = Song.all.select {|entry| entry.artist.name == artist}
    artist_library.sort_by! {|song| song.name}
    artist_library.each_with_index do |song, index|
      puts "#{index += 1}. #{song.name} - #{song.genre.name}"
    end 
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    song_library = Song.all.select {|entry| entry.genre.name == genre}
    song_library.sort_by! {|entry| entry.name}
    song_library.each_with_index do |song, index|
      puts "#{index += 1}. #{song.artist.name} - #{song.name}"
    end 
  end
  
  def play_song
    puts "Which song number would you like to play?"
    number = gets.strip.to_i
    songs = Song.all.sort_by {|song| song.name}
    songs.each_with_index do |song, index|
        index += 1
        if index == number
          puts "Playing #{song.name} by #{song.artist.name}"
        end 
    end 
  end
end 

