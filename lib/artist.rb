require 'pry'
class Artist
 attr_accessor :name

 @@all = []

 def initialize(name)
   @name = name
   @songs = []
 end

 def self.all
   @@all
 end

 def songs
   @songs
 end
 def save
   @@all << self
 end

 def add_song(song)
   if !song.artist
     song.artist = self
     @songs << song
   end
 end

 def genres
   #binding.pry
   @songs.map do |song|

     song.genre
  end
 end

 def self.destroy_all
   self.all.clear
 end

 def self.create(artist_name)
   artist = self.new(artist_name)
   artist.name = artist_name
   artist.save
   artist
 end
end
