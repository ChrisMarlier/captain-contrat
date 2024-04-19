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
      (fights.count / victories.count)*100
    rescue 
      0
    end

    private
  
    def total_attributes_under_limit
       unless total_attributes_under_limit?
         errors.add(:base, "La somme des attributs ne peut pas dépasser 10.")
       end
    end
end
