require 'spec_helper'

describe RspecPacmanFormatter::Pacman do
  before do
    allow(STDOUT).to receive(:print)
    allow(STDOUT).to receive(:puts)
  end

  let(:args) { '' }
  let(:start_notification) { double(count: 10) }
  subject(:pacman) { described_class.new(args) }

  it 'sets the attributes' do
    expect(pacman).to have_attributes(progress_line: '', failed: 0)
  end

  describe '#start' do
    it 'prints start message' do
      expect(STDOUT).to receive(:puts).with('GAME STARTED').once
      expect(pacman.start(start_notification))
    end

    it 'sets the progress line' do
      pacman.start(start_notification)
      expect(pacman.progress_line).to eq('••••••••••')
    end
  end

  describe '#example_started' do
    subject(:example_started) do
      pacman.start(start_notification)
      pacman.example_started(double)
      pacman.progress_line
    end
    it 'adds the pacman character to the progress bar' do
      expect(example_started).to eq('ᗧ•••••••••')
    end
  end

  describe '#example_passed' do
    subject(:example_passed) do
      pacman.start(start_notification)
      pacman.example_started(double)
      pacman.example_passed(double)
      pacman.progress_line
    end
    it 'adds the passed characted to the progress bar' do
      expect(example_passed).to eq('.•••••••••')
    end
  end

  describe '#example_failed' do
    subject(:example_failed) do
      pacman.start(start_notification)
      pacman.example_started(double)
      pacman.example_failed(double)
      pacman.progress_line
    end
    it 'adds the passed characted to the progress bar' do
      expect(example_failed).to eq('ᗣ•••••••••')
    end
  end

  describe '#example_pending' do
    subject(:example_pending) do
      pacman.start(start_notification)
      pacman.example_started(double)
      pacman.example_pending(double)
      pacman.progress_line
    end
    it 'adds the passed characted to the progress bar' do
      expect(example_pending).to eq('*•••••••••')
    end
  end

  describe '#close' do
    context 'have failed test' do
      before do
        pacman.failed = 1
        expect(STDOUT).to receive(:puts).exactly(1)
      end
      it 'prints GAME OVER' do
        expect(pacman.close(double))
      end
    end
  end
end
