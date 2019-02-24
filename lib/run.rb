require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name, artist_name)
    @name = name
    @artist_name = artist_name
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name, artist_name)
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song.save
  end

  # call this as: Song.find_by_name("Happy") - self == Class
  def self.find_by_name(song)
    self.all.find { |inst| inst.name == song  }
    # returns the instance
  end

  def self.find_or_create_by_name(song)
    result = self.find_by_name
    if result == nil

    else
      result
  end

end

s1 = Song.new("Happy", "Pharrell")
s2 = Song.new("Troll Song", "JT")



binding.pry

"some text"
