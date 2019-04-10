class Song 
  attr_accessor :name, :artist, :genre 
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    @@all << self 
    self.artist = artist if artist 
    self.genre = genre if genre 
  end 

  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(song)
    song = Song.new(song) 
    song.save 
    song 
  end 
  
  def self.find_by_name(name)
    all.detect {|s| s.name == name}
  end 

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name) 
  end 
  
  def self.new_from_filename(filename)
    @name = filename.split(" - ")[0]
    @artist = filename.split(" - ")[1]
    @genre = filename.split(" - ")[2]
    song = self.new(@name, @artist, @genre) 
  end 
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end 
end 