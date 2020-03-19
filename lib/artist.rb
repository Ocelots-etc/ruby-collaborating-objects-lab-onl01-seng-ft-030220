require 'pry'

class Artist

  attr_accessor :name, :songs, :add_song, :print_songs, :find_or_create_by_name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def add_song(song)
    # Song.new(song.name)
    song.artist = self
  end

  def songs
    @songs = []
    Song.all.select { |song| song.artist == self }
              #  if song.artist != nil
              #   if song.artist.name == self.name
                 @songs << song
  end
    @songs = @songs.uniq
  end

  def self.find_or_create_by_name(find_artist)
    self.find(name) ? self.find(name) : self.new(name)
  end

  def self.find(name)
    self.all.find { |artist| artist.name == name }
  end

  def print_songs
    songs = self.songs.uniq
    songs.each do |song|
      puts song.name
    end
  end


end
