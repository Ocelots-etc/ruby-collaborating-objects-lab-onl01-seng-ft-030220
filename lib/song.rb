class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    # file_pieces[0] = filename.split(" - ")
    # splits it into an array
    # artist - file_pieces[0]
    # song = file_pieces[1]
    # .strip takes all special characters and extra junk data
    # like in scrapping instead of API and .gsub
  end

end
