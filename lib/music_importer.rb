class MusicImporter 
  
  def initialize(file) 
    @path = file 
  end 
  
  def path 
    @path 
  end
  
  def files
    @files = Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
  end 
  
  def import
    self.files.each {|file| Song.create_from_filename(file) }
  end
  
end