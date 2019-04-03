class Artist 
  
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self
    @songs = []
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
  
  def self.create(name)
    Artist.new(name)
  end
  
  def songs=(song)
    @songs << song
  end 
  
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless self.songs.include?(song)
  end
    
  def genres 
    genres = self.songs.collect do |song|song.genre
  end
  genres.uniq
  end

end
