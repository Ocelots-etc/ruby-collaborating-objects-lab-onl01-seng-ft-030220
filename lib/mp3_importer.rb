class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    # @files ||= Dir.entries(@path).select {|song| !File.directory?(song) && song.end_with?(".mp3")}
    # set an instance variable that is equal to all the possible paths that music can come in on
    @files ||= Dir.glob("#{path}/*.mp3").collect do |file|
      file.gsub("#{path}/", "")

    end
    # /*.mp3 escapes the space
    # (Dir) built into computer - .glob does what?: opening MP3Importer and looping through each of those files
    # first we have to take out from the ./spec through to where it says .mp3
  end

  def import
    files.each {|song| Song.new_by_filename(song)}
    # call the files method and loop through each file and create a
  end
end
