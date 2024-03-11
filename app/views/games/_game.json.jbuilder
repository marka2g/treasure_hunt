json.extract! game, :id, :user_id, :board_size, :treasure_x, :treasure_y, :current_position, :winning_distance, :created_at, :updated_at
json.url game_url(game, format: :json)
