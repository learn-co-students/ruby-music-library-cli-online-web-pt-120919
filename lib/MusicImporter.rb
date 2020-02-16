class MusicImporter 
  attr_accessor :path,:song,:artist,:genre
  def initialize(path)
    @path = path 
  end 
  def files 
    Dir.entries(@path).select! do |entry|
      entry.end_with?(".mp3")
  end 
end 
def import 
  self.files.each do |x|
    
  Song.create_from_filename(x)
end
end
  
end 