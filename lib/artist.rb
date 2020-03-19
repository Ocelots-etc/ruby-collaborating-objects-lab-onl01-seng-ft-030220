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
    Song.new(song.name)
    song.artist = self
  end

  def songs
    @songs = []

       Song.all.each do |song|
            if song.artist != nil
                if song.artist.name == self.name
                 @songs << song
                end
            end
       end

    @songs = @songs.uniq

  end

  def self.find_or_create_by_name(find_artist)
    artists = @@all
    n = 0
    artists.each do |artist|
      puts artist
      if artist.name == find_artist
        n+=1
        return artist
      end
      unless n >= 1
        artist = Artist.new(find_artist)
        return artist
      end

    end

  end

  def print_songs
    songs = self.songs.uniq
    songs.each do |song|
      puts song.name
    end
  end


end
