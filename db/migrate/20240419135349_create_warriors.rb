class CreateWarriors < ActiveRecord::Migration[7.0]
  def change
    create_table :warriors do |t|
      t.string :name
      t.integer :level, default: 1
      t.integer :experience, default: 0
      t.integer :attack
      t.integer :defense
      t.integer :health, default: 100

      t.timestamps
    end
  end
end
