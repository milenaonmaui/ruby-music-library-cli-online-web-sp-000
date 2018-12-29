require 'pry'
class MusicLibraryController

   def initialize(path = "./db/mp3s")
     #@path = path
     music_importer = MusicImporter.new(path)
     music_importer.import
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
      puts "What would you like to do?"
      user_input = gets.strip
      until user_input == exit
        call
      end
   end

   def list_songs
     #binding.pry
     i=1
     songs_sorted = Song.all.uniq.sort_by(&:name)
     songs_sorted.each do |song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i+=1
     end
   end

   def list_artists
     i=1
     artists_sorted = Artist.all.uniq.sort_by(&:name)
     artists_sorted.each do |artist|
      puts "#{i}. #{artist.name}"
      i+=1
     end
   end

   def list_genres
     i=1
     genres_sorted = Genre.all.uniq.sort_by(&:name)
     genres_sorted.each do |genre|
      puts "#{i}. #{genre.name}"
      i+=1
     end
   end

   def list_songs_by_artist
     puts "Please enter the name of an artist:"
     user_input = gets.strip
   end
end
