require_relative '../aggregator.rb'

describe Aggregator do
  let(:separator) { ' ' }
  let(:subject) { described_class.new(separator) }
  let(:empty_entries) { [] }
  let(:empty_results) { {} }
  let(:entries) { ['line/1 ip1', 'line/2 ip1', 'line/1 ip2', 'line/1 ip1'] }


  it { is_expected.to respond_to(:separator) }
  it { expect(subject.sort_expression).to eq('reverse') }

  describe '#totalize(values)' do
    let(:results) do
      [{"line/1"=>3}, {"line/2"=>1}]
    end

    it 'returns an empty results object for empty_entries' do
      expect(subject.totalize(empty_entries)).to eq(empty_results)
    end

    it 'returns the expected results for the example entries' do
      expect(subject.totalize(entries)).to eq(results)
    end
  end

  describe '#totalize_unique(values)' do
    let(:results) do
      [{"line/1"=>2}, {"line/2"=>1}]
    end

    it 'returns an empty results object for empty_entries' do
      expect(subject.totalize_unique(empty_entries)).to eq(empty_results)
    end

    it 'returns the expected results for the example entries' do
      expect(subject.totalize_unique(entries)).to eq(results)
    end
  end
end
