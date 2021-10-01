class ContentManager
  attr_accessor :filename, :lines

  def initialize(filename)
    @filename = filename
    @lines = []
  end

  def build_lines
    @lines = File.readlines(self.filename, chomp: true)
  end
end
