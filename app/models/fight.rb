class Fight < ApplicationRecord
    belongs_to :warrior1, class_name: 'Warrior'
    belongs_to :warrior2, class_name: 'Warrior'

    belongs_to :winner, class_name: 'Warrior', optional: true

    has_many :fight_events

    validates :warrior1, :warrior2, presence: true

    def start
        FightSimulation.new(self).call
    end
end
