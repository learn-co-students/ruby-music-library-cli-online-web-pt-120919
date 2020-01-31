class MusicImporter
  attr_reader :path 
  
  def initialize(path)
    @path = path
    @files = []
  end
  
  def files 
    files = Dir.entries(@path)
    files.each do |file|
      @files << file if file.length > 4
    end
    @files.uniq
  end
  
  def import 
    self.files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end
end