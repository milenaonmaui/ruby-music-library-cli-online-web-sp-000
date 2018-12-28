class Song
 attr_accessor :name
 @@all = []

 def initialize(name, artist = nil, genre = nil)
   @name = name
   self.artist = artist if artist
   self.genre = genre if genre
 end

 def self.all
   @@all
 end

 def save
   @@all << self
 end

def artist
  @artist
end

def genre
  @genre
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  genre.songs << self unless genre.songs.include?(self)
end

 def self.destroy_all
   self.all.clear
 end

 def self.create(song_name)
   song = self.new(song_name)
   song.name = song_name
   song.save
   song
 end


end
