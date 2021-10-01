require 'pry'
require 'set'

class Aggregator
  attr_accessor :separator

  def sort_expression
    'reverse'
  end

  def initialize(separtor)
    @separtor = separtor
  end

  def run(entries)
    return {} if entries.empty?

    distinct_results = Set.new(entries.map { |item| item.split(self.separator) }).
      group_by { |key, _| key }
    quantified_results = distinct_results.map { |result, findings| { result => findings.count } }

    return quantified_results.sort_by { |hsh| hsh.values }.send(sort_expression)
  end
end
