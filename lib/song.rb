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
    new_song = self.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.alphabetical
    sorted = @@all.sort_by {|song| song.name }
  end

  def self.new_from_filename(file_name)
    if file_name.end_with?(".mp3")
      file_name.slice!(".mp3")
      file_name = file_name.split(" - ")
      new_song = create_by_name(file_name[1])
      new_song.artist_name = file_name[0]
    end
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = new_from_filename(file_name)
    @@all << new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
