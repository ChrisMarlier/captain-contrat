class Warrior < ApplicationRecord
    validates :attack, :name, :defense, :health, presence: true
    validate :total_attributes_under_limit, on: :create
  
    def total_attributes_under_limit?
      (attack || 0) + (defense || 0) <= 10
    end
  
    def victories
      Fight.where(winner: self)
    end

    def fights
      Fight.where(warrior1: self).or(Fight.where(warrior2: self))
    end

    def winrate
      ((victories.count.to_f / fights.count) * 100).round(2)
    rescue 
      0
    end

    def rewards
      self.experience += rand(15..35)
      level_up if level_up?
      self.save!
    end

    def level_up?
      experience >= 100
    end

    def level_up 
      self.experience = 0
      self.level += 1
      self.attack += rand(1..3)
      self.defense += rand(1..3)
    end

    private
  
    def total_attributes_under_limit
       unless total_attributes_under_limit?
         errors.add(:base, "La somme des attributs ne peut pas dépasser 10.")
       end
    end
end
