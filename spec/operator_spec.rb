require_relative '../operator.rb'

describe Operator do
  # Assuming you are running from the root
  let(:filename) { './spec/fixtures/webserver.log' }
  let(:separator) { ' ' }
  let(:subject) { described_class.new(filename, separator) }

  it { is_expected.to respond_to(:aggregator) }
  it { is_expected.to respond_to(:content_manager) }

  describe '#tabulate' do
    let(:top_result) { { '/about/2' => 90 } }
    let(:last_result) { { '/home' => 78 } }
    let(:results_sample) { [top_result, last_result] }

    it 'returns the expected top result first' do
      expect(subject.tabulate.first).to eq(top_result)
    end

    it 'includes the expected results' do
      expect(subject.tabulate.last).to eq(last_result)
    end
  end

  describe '#tabulate_unique' do
    let(:top_result) { { '/index' => 23 } }
    let(:last_result) { { '/about' => 21 } }
    let(:results_sample) { [top_result, last_result]  }

    it 'returns the expected top result first' do
      expect(subject.tabulate_unique.first).to eq(top_result)
    end

    it 'includes the expected results' do
      expect(subject.tabulate_unique.last).to eq(last_result)
    end
  end
end
