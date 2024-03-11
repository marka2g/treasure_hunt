class CreateMoves < ActiveRecord::Migration[7.1]
  def change
    create_table :moves do |t|
      t.references :game, null: false, foreign_key: true
      t.integer :x
      t.integer :y
      t.boolean :winner
      t.string :distance_away

      t.timestamps
    end
  end
end
