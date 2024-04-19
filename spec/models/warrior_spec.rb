# spec/models/warrior_spec.rb

require 'rails_helper'

RSpec.describe Warrior, type: :model do
    describe 'validations' do
        it 'is valid with valid attributes' do
            warrior = Warrior.new(name: 'John', attack: 5, defense: 5, health: 100)
            expect(warrior).to be_valid
        end

        it 'is not valid without a name' do
            warrior = Warrior.new(attack: 10)
            expect(warrior).not_to be_valid
        end

        it 'is not valid with more than 10 points' do
            warrior = Warrior.new(name: 'John', attack: 5, defense: 8, health: 100)
            expect(warrior).not_to be_valid
        end
    end

    describe 'winrate' do
        before do
            @warrior = Warrior.create(name: 'John', attack: 5, defense: 5, health: 100) 
            @warrior2 = Warrior.create(name: 'Jane', attack: 5, defense: 5, health: 100)
            Fight.create(warrior1: @warrior, warrior2: @warrior2, winner: @warrior, winner: @warrior)
            Fight.create(warrior1: @warrior, warrior2: @warrior2, winner: @warrior2, winner: @warrior2)
        end

        it 'returns the right winrate' do
            expect(@warrior.winrate).to eq(50)
        end
    end
end