require 'set'

class Aggregator
  attr_accessor :separator

  def sort_expression
    'reverse'
  end

  def initialize(separtor)
    @separtor = separtor
  end

  def totalize(entries)
    return {} if entries.empty?

    results = entries.map { |item| item.split(self.separator) }.group_by { |key, _| key }
    output = results.map { |result, findings| { result: result, count: findings.count } }

    return output.sort_by { |entry| entry[:count] }.send(sort_expression)
      .map { |item| { item[:result] => item[:count]} }
  end

  def totalize_unique(entries)
    return {} if entries.empty?

    distinct_results = Set.new(entries.map { |item| item.split(self.separator) }).
      group_by { |key, _| key }
    output = distinct_results.map { |result, findings| { result => findings.count } }

    return output.sort_by { |hsh| hsh.values }.send(sort_expression)
  end
end
