class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save 
    self.class.all << self
  end

  def self.create
    song =self.new
    song.save 
    song
  end

  def self.new_by_name(song_name)
    song =self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|a| a.name}
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
         #variable parts = argument is split by the - ("Taylor Swift - Blank Space.mp3")
    artist_name = parts[0]  
         #artist_name method = parts[first spot = Taylor Swift]
    song_name = parts[1].gsub(".mp3", "") 
          #song_name = parts[second spot - Blank Space] removes.mp3 with gsub and 
          #replaces with nothing
    song = self.new   # new Song is initiated
    song.name = song_name    # newSong.#name = Blank Space
    song.artist_name = artist_name    # newSong.#artist_name = Taylor Swift
    song    #then just the song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
