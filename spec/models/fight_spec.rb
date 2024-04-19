# spec/models/fight_spec.rb

require 'rails_helper'

RSpec.describe Fight, type: :model do
    before do
        @warrior = Warrior.create(name: 'John', attack: 5, defense: 5, health: 100) 
        @warrior2 = Warrior.create(name: 'Jane', attack: 5, defense: 5, health: 100)
    end

    describe 'validations' do
        it 'is valid with valid attributes' do
            fight = Fight.new(warrior1: @warrior, warrior2: @warrior2)
            expect(fight).to be_valid
        end

        it 'is not valid with the same wariors' do
            fight = Fight.new(warrior1: @warrior, warrior2: @warrior)
            expect(fight).not_to be_valid
        end
    end
end