require_relative 'aggregator'
require_relative 'content_manager'
require 'pry'

class Operator
  attr_accessor :aggregator, :content_manager

  def initialize(filename, separator)
    @content_manager = ContentManager.new(filename)
    self.content_manager.build_lines

    @aggregator = Aggregator.new(separator)
  end

  def tabulate
    lines = content_manager.lines
    results = aggregator.run(lines)

    return results
  end
end
