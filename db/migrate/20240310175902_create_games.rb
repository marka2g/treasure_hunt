class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.references :user, null: false, foreign_key: true
      t.string :board_size, default: "", null: false
      t.string :treasure_x, default: "", null: false
      t.string :treasure_y, default: "", null: false
      t.integer :current_position, array: true, default: [0, 0]
      t.integer :winning_distance

      t.timestamps
    end
  end
end
