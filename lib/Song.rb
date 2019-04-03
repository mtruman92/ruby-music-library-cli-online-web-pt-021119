class Song 
  
  extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    #@@all << self
    
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
    save
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

  def self.create(song, artist=nil, genre=nil)
   new_song = Song.new(song, artist, genre)
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre 
    self.genre.songs << self unless genre.songs.include?(self)
  end 
  
  def self.find_by_name(song_name)
    self.all.detect {|song|song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create(song_name)
  end
  
 def self.new_from_filename(filename)
    title = filename.split(" - ")
    artist = Artist.find_or_create_by_name(title[0])
    genre = Genre.find_or_create_by_name(title[2][0..-5])
    create(title[1], artist, genre)
  end 
  
  def self.create_from_filename(file_name)
    new_from_filename(file_name).tap { |song| song.save }
  end    
  
end 