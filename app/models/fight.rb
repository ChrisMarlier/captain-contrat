class Fight < ApplicationRecord
    belongs_to :warrior1, class_name: 'Warrior'
    belongs_to :warrior2, class_name: 'Warrior'

    belongs_to :warrior1_item, class_name: 'Item', optional: true
    belongs_to :warrior2_item, class_name: 'Item', optional: true

    belongs_to :winner, class_name: 'Warrior', optional: true

    has_many :fight_events, dependent: :destroy

    validates :warrior1, :warrior2, presence: true
    validate :different_warriors

    def start
        ::FightSimulation.new(self).call
    end

    private

    def different_warriors
        if warrior1_id == warrior2_id
          errors.add(:base, "You can't fight yourself !")
        end
      end
end
