require_relative '../content_manager.rb'


describe ContentManager do
  let(:filename) { 'example_log.txt' }
  let(:subject) { described_class.new(filename) }

  it { is_expected.to respond_to(:filename) }
  it { is_expected.to respond_to(:lines) }

  describe '#build_lines' do
    let(:lines) { ['line 1', 'line 2'] }

    context 'for a non-existing file' do
      before do
        allow(File).to receive(:exists?).with(filename).and_return(false)
      end

      it 'raises the expected error' do
        expect {
          subject.build_lines
        }.to raise_error(Errno::ENOENT)
      end
    end

    context 'for an existing file' do
      before do
        allow(File).to receive(:exists?).with(filename).and_return(false)
        allow(File).to receive(:readlines).with(filename).and_return(lines)
      end

      it 'does not raise any errors' do
        expect {
          subject.build_lines
        }.to_not raise_error
      end

      it 'changes the lines array' do
        expect {
          subject.build_lines
        }.to change { subject.lines }.from([]).to(lines)
      end
    end
  end
end
