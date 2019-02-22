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
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = new_by_name(name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
     find_by_name(name)? find_by_name(name):create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    split_name = filename.split(" - ")
    name_mp3 = split_name[1].split(".")
    name = name_mp3[0]
    artist = split_name[0]
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    @@all << new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end







#ß
