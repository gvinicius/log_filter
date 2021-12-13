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
    results = aggregator.totalize(lines)

    return results
  end

  def tabulate_unique
    lines = content_manager.lines
    results = aggregator.totalize_unique(lines)

    return results
  end

  def average
    lines = content_manager.lines
    results = aggregator.average(lines)

    return results
  end
end
