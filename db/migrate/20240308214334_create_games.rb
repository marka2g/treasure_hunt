class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :email
      t.integer :board_size
      t.integer :history, array: true, default: []

      t.timestamps
    end
  end
end
