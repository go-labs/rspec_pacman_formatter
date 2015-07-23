require 'spec_helper'

describe RspecPacmanFormatter do
  it 'has a version number' do
    expect(RspecPacmanFormatter::VERSION).not_to be nil
  end

  it 'loads the pacman class' do
    expect(RspecPacmanFormatter::Pacman.name).to eq('RspecPacmanFormatter::Pacman')
  end
end
