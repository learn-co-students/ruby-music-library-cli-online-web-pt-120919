class MusicImporter

    attr_reader :path 
    def initialize(path_name)
        @path = path_name
    end

    def files
        path_name = @path + "/*"
        load_files = Dir.glob(path_name)
        load_files.collect{|file| file.slice!(path_name.size-1 .. -1)}
    end

    def import
        list =[]
        self.files.collect do |song|
            list << Song.create_from_filename(song)
        end
        list 
    end


end