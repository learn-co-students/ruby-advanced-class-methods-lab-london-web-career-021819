class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #(name, artist)
    song_instance = self.new
    # song.name = name
    # song.artist = artist
    self.all << song_instance
    song_instance
  end

  def self.new_by_name(name)
    song_instance = self.new
    song_instance.name = name
    song_instance
  end

  def self.create_by_name(name)
    song_instance = self.new_by_name(name)
    self.all << song_instance
    song_instance
  end

  def self.find_by_name(researched_name)
    self.all.find {|song_instance| song_instance.name == researched_name} #return the matching song_instance or false
  end

  def self.find_or_create_by_name(researched_name)
    if self.find_by_name(researched_name) != nil
      self.find_by_name(researched_name)
    else
      self.create_by_name(researched_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song_instance| song_instance.name}
  end

  def self.new_from_filename(song_mp3)
    song_instance = self.new
    array = song_mp3.split(" - ")
    song_instance.name = array[1].chomp(".mp3")
    song_instance.artist_name = array[0]
    song_instance
  end

  def self.create_from_filename(song_mp3)
    song_instance = self.new_from_filename(song_mp3)
    self.all << song_instance
    song_instance
  end

  def self.destroy_all
    self.all.clear
  end


end
