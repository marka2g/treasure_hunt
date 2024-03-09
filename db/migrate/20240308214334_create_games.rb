class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :email, default: "", null: false
      t.string :board_size, default: "", null: false
      t.string :plot_location, default: "", null: false
      t.string :treasure_x, default: "", null: false
      t.string :treasure_y, default: "", null: false
      t.integer :move_history, array: true, default: []
      t.integer :winning_distance

      t.timestamps
    end
  end
end
