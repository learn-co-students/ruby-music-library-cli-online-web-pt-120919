class MusicLibraryController

	def initialize(path = './db/mp3s')
		@import = MusicImporter.new(path).import
	end

	def call
		puts 'Welcome to your music library!'
		puts "To list all of your songs, enter 'list songs'."
		puts "To list all of the artists in your library, enter 'list artists'."
		puts "To list all of the genres in your library, enter 'list genres'."
		puts "To list all of the songs by a particular artist, enter 'list artist'."
		puts "To list all of the songs of a particular genre, enter 'list genre'."
		puts "To play a song, enter 'play song'."
		puts "To quit, type 'exit'."
		puts "What would you like to do?"
		
		input = gets.chomp

		if input == 'list songs'
			list_songs
			call
		elsif input == 'list artists'
			list_artists
			call
		elsif input == 'list genres'
			list_genres
			call
		elsif input == 'list artist'
			list_songs_by_artist
			call
		elsif input == 'list genre'
			list_songs_by_genre
			call
		elsif input == 'play song'
			play_song
			call
		elsif input == 'exit'
			nil
		else
			call
		end

	end

	def sort_by_name(objects)
		objects.sort do |a, b|
			a.name <=> b.name
		end
	end

	def list_songs
		songs = sort_by_name(Song.all)
		songs.each_with_index do |song, index|
			puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
		end
	end

	def list_artists
		artists = sort_by_name(Artist.all)
		artists.each_with_index do |artist, index|
			puts "#{index + 1}. #{artist.name}"
		end
	end

	def list_genres
		genres = sort_by_name(Genre.all)
		genres.each_with_index do |genre, index|
			puts "#{index + 1}. #{genre.name}"
		end
	end

	def list_songs_by_artist
		puts "Please enter the name of an artist:"
		artist = gets.chomp
		artist_songs = Song.all.select do |song|
			song.artist.name == artist
		end
		artist_songs = sort_by_name(artist_songs)
		artist_songs.each_with_index do |song, index|
			puts "#{index + 1}. #{song.name} - #{song.genre.name}"
		end
	end

	def list_songs_by_genre
		puts "Please enter the name of a genre:"
		genre = gets.chomp
		genre_songs = Song.all.select do |song|
			song.genre.name == genre
		end
		genre_songs = sort_by_name(genre_songs)
		genre_songs.each_with_index do |song, index|
			puts "#{index + 1}. #{song.artist.name} - #{song.name}"
		end
	end

	def play_song
		puts "Which song number would you like to play?"
		number = gets.chomp.to_i - 1
		if number > 0 && number < Song.all.length
			song = sort_by_name(Song.all)[number]
		end
		if song
			puts "Playing #{song.name} by #{song.artist.name}"
		end
	end

end