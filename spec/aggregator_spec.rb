require_relative '../aggregator.rb'


describe Aggregator do
  let(:targeted_column) { 0 }
  let(:grouped_column) { 1 }
  let(:subject) { described_class.new(targeted_column, grouped_column) }

  it { is_expected.to respond_to(:targeted_column) }
  it { is_expected.to respond_to(:grouped_column) }
  it { is_expected.to respond_to(:separator) }
  it { is_expected.to respond_to(:sort_expression) }
  it { expect(described_class.separator) eq(' ') }
  it { expect(described_class.sort_expression) eq('asc') }

  describe '#run' do
    let(:empty_entries) { [] }
    let(:empty_results) { {} }
    let(:entries) { ['', 'line/2 ip1', 'line 1 ip2'] }
    let(:results) { ['line/1 ip1', 'line/2 ip1', 'line/1 ip2'] }

    it 'returns an empty results object for empty_entries' do
      expect(described_class.run(empty_entries)).to eq(empty_results)
    end

    it 'returns the expected results for the example entries' do
      expect(described_class.run(empty_entries)).to eq(results)
    end
  end
end
