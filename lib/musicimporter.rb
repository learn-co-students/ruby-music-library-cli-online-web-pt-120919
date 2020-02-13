class MusicImporter
  
  attr_accessor :path, :files
  
  def initialize(path)
    @path = path
  end
  
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |i| i.gsub("#{path}/", "") }
  end
  
  def import
    files.each {|files| Song.create_from_filename(files)}
  end
  
  
  
end