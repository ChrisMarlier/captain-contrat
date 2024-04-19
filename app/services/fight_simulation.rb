class FightSimulation
    attr_reader :warrior1, :warrior2

    def initialize(fight)
        @fight = fight
        @warrior1 = fight.warrior1
        @warrior2 = fight.warrior2
        @warrior1_item = fight.warrior1_item
        @warrior2_item = fight.warrior2_item
        @warriors_order = [warrior2, warrior1].shuffle
    end

    def call 
        while !finished?
            event
            @warriors_order = @warriors_order.reverse
        end
        @fight.update!(winner_id: winner.id)
    end

    def event
        damage = simulate_attack
        @warriors_order[1].health -= damage
        FightEvent.create!(fight: @fight, attacker_name: @warriors_order[0].name, defender_name: @warriors_order[1].name, damage: damage, defender_health: @warriors_order[1].health)
    end
    
    def finished?
        warrior1.health<= 0 || warrior2.health <= 0
    end
    
    def simulate_attack
        damage = rand(1..6) * @warriors_order[0].attack + item_damage(@warriors_order[0]) - @warriors_order[1].defense
        damage < 0 ? 0 : damage
    end

    def item_damage(warrior)
        item = current_item(@warriors_order[0])
        item ? item.damage : 0
    end

    def current_item(warrior)
        warrior == @warrior1 ? @warrior1_item : @warrior2_item
    end

    def winner 
        warrior1.health <= 0 ? warrior2 : warrior1
    end
end