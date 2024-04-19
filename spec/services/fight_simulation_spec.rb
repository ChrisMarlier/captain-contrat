# spec/services/fight_simulation_spec.rb
require 'rails_helper'

RSpec.describe FightSimulation do
  
  describe '#call' do
    let(:warrior1) { Warrior.create!(name: 'John', attack: 5, defense: 5, health: 100) }
    let(:warrior2) { Warrior.create!(name: 'Jane', attack: 5, defense: 5, health: 1) }
    let(:fight) { Fight.create!(warrior1: warrior1, warrior2: warrior2) }

    it 'updates the fight with the winner when winner is sure' do
        described_class.new(fight).call
        expect(fight.reload.winner).to eq(warrior1)
    end 

    it 'creates fight events' do
        described_class.new(fight).call
        expect(fight.fight_events.count).to be > 1
    end

    it 'stops when a warrior has no health' do
        simulation = described_class.new(fight)
        simulation.call
        expect(simulation.finished?).to be true
        expect(simulation.winner).to eq(warrior1)
        expect(simulation.warrior1.health).to be > 0        
    end
  end
end
