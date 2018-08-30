class MP3Importer

  attr_reader :path

  def initialize(file_path)
    @path = file_path

  end

  def files
    @files = Dir.entries(@path)
    @files.delete_if do |filename|
      filename[0] == "."
    end
  end
  def import
    files
    @files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end
