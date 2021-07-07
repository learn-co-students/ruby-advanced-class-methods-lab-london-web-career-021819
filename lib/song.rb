require 'pry'

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
    song = self.new
    all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    all << song
    song
  end 

  def self.find_by_name(name)
    all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    all.sort_by do |song| 
      # binding.pry
      song.name
    end
    # binding.pry
  end

  def self.new_from_filename(filename)
    song_ary = filename.split(/[\.-]/)
    song = new_by_name(song_ary[1].strip)
    song.artist_name = song_ary[0].strip
    song
  end

  def self.create_from_filename(filename)
    all << new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

end
