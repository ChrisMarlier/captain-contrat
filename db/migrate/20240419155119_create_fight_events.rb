class CreateFightEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :fight_events do |t|
      t.references :fight, null: false, foreign_key: true
      t.string :attacker_name
      t.string :defender_name
      t.integer :damage
      t.integer :defender_health

      t.timestamps
    end
  end
end
