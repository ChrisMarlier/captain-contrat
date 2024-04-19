class Fight < ApplicationRecord
    belongs_to :warrior1, class_name: 'Warrior'
    belongs_to :warrior2, class_name: 'Warrior'

    validates :warrior1, :warrior2, presence: true

    def start
        FightSimulation.new(self).call
    end
end
