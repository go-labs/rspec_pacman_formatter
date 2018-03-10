require 'spec_helper'

describe RspecPacmanFormatter::Characters do
  describe '.random_ghost' do
    it 'returns a random ghosts' do
      expect(described_class.random_ghost).to match(/ᗣ/)
    end
  end
end
