require 'set'
require 'pry'

class Aggregator
  attr_accessor :separator

  def sort_expression
    'reverse'
  end

  def initialize(separtor)
    @separtor = separtor
  end

  def totalize(entries)
    return [] if entries.empty?

    results = entries.map { |item| item.split(self.separator) }.group_by { |key, _| key }
    output = results.map { |result, findings| { result: result, count: findings.count } }
    final_output = output.sort_by { |entry| entry[:count] }.send(sort_expression)
      .map { |item| { item[:result] => item[:count]} }

    return final_output.any? ? final_output : []
  end

  def extract_unique_entries(entries)
    Set.new(entries.map { |item| item.split(self.separator) })
  end

  def totalize_unique(entries)
    # return [] if entries.empty?

    distinct_results = extract_unique_entries(entries).
      group_by { |key, _| key }
    output = distinct_results.map { |result, findings| { result => findings.count } }
    final_output = output.sort_by { |hsh| hsh.values }.send(sort_expression)

    return final_output.any? ? final_output : []
  end

  # avarage = (total / number_of_distinct_elements)
  def average(entries)
    total_results = totalize(entries)
    unique_results = totalize_unique(entries)
    hash_total_results = total_results.reduce({}, :merge)
    hash_unique_results = unique_results.reduce({}, :merge)
    hash_avarage_results = hash_total_results.map { |key, value| { key => value.to_f/hash_unique_results[key]  } }
    final_output = hash_avarage_results.sort_by { |hsh| hsh.values }.send(sort_expression)

    return final_output.any? ? final_output : []
  end
end
