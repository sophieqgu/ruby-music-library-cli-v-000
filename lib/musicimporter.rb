class MusicImporter 
  attr_accessor :path 
  def initialize(path)
    @path = path
  end 
  
  def files
    Dir.glob("*.mp3", base: "#{@path}")
  end 
  
  def self.import 
    self.files.collect {|filename| Song.create_from_filename(filename)}
  end 
end 