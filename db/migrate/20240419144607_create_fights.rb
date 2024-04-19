class CreateFights < ActiveRecord::Migration[7.0]
  def change
    create_table :fights do |t|
      t.references :warrior1, null: false, foreign_key: { to_table: :warriors }
      t.references :warrior2, null: false, foreign_key: { to_table: :warriors }

      t.references :winner, foreign_key: { to_table: :warriors }

      t.references :warrior1_item, null: true, foreign_key: { to_table: :items }
      t.references :warrior2_item, null: true, foreign_key: { to_table: :items }

      t.timestamps
    end
  end
end
