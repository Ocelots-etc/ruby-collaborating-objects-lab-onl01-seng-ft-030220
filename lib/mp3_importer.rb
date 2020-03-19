class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.entries(@path).select {|song| !File.directory?(song) && song.end_with?(".mp3")}
    # set an instance variable that is equal to all the possible paths that music can come in on
    
  end

  def import
    files.each {|song| Song.new_by_filename(song)}
    # call the files method and loop through each file and create a 
  end
end
