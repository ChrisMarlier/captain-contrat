class Warrior < ApplicationRecord
    validates :attack, :name, :defense, :health, presence: true
    validate :total_attributes_under_limit
  
    def total_attributes_under_limit?
      (attack || 0) + (defense || 0) + (health || 0) <= 10
    end
  
    private
  
    def total_attributes_under_limit
       unless total_attributes_under_limit?
         errors.add(:base, "La somme des attributs ne peut pas dépasser 10.")
       end
    end
end
