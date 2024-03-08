class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :email
      t.integer :board_size
      t.integer :move_history, array: true, default: []
      t.integer :winning_distance

      t.timestamps
    end
  end
end
