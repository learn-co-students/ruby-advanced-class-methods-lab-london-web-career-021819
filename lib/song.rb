class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # why don't you pass anything into this method??? (see run.rb)
  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.new_by_name_and_artist(song_name, artist_name)
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_by_name_and_artist(song_name, artist_name)
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find { |inst| inst.name == song_name  }
    # returns the matching instance of the song with the name that was passed in
  end

  # added debug statements to display flow and input of tests:
  def self.find_or_create_by_name(song_name) # song is a string
    # puts "let's see if the song #{song_name} exists in the array..."
    result = self.find_by_name(song_name)
    if result == nil # create
      puts "we need to make the song #{song_name}"
      self.create_by_name(song_name)
    else
      puts "we already made the song #{song_name}"
      result
    end
  end

  def self.alphabetical
    self.all.sort { |x, y| x.name <=> y.name }
  end

  def self.new_from_filename(filename)
    puts "Filename contents: #{filename}"
    elements = filename.split("-")
    song_title = elements.last.split(".").first.strip
    artist_name = elements.first.strip
    self.new_by_name_and_artist(song_title, artist_name)
  end

  def self.create_from_filename(filename)
    elements = filename.split("-")
    song_title = elements.last.split(".").first.strip
    artist_name = elements.first.strip
    self.create_by_name_and_artist(song_title, artist_name)
  end

  def self.destroy_all
    self.all.clear
  end

end
