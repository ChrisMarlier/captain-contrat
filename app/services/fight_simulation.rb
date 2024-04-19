class FightSimulation
    attr_reader :warrior1, :warrior2

    # FightSimulation.new(Warrior.first,Warrior.last)
    def initialize(fight)
        @warrior1 = fight.warrior1
        @warrior2 = fight.warrior2
        @warriors_order = [warrior2, warrior1].shuffle
    end

    def call 
        while !finished?
            event
            @warriors_order = @warriors_order.reverse
        end
        puts "Le combat est terminé ! Le vainqueur est #{winner.name} !\n"
    end

    def event
        @warriors_order[1].health -= damage
        puts "#{@warriors_order[0].name} attaque #{@warriors_order[1].name} et lui inflige #{damage} points de dégâts.\n"
    end
    
    def finished?
        warrior1.health<= 0 || warrior2.health <= 0
    end
    
    def damage
        rand(1..6) * @warriors_order[0].attack - @warriors_order[1].defense
    end

    def winner 
        warrior1.health <= 0 ? warrior2 : warrior1
    end
end