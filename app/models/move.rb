class Move < ApplicationRecord
  belongs_to :game

  with_options presence: true do
    validates :x
    validates :y
  end

  # encrypts :distance_away
  before_save :triangulate
  broadcasts_to :game

private

  def triangulate
    set_current_position()
    set_distance_away()
    distance_away.to_i < 1000 ? win() : keep_playing()
  end

  def set_current_position
    game.current_position = [game.current_position[0] += x, game.current_position[1] += y]
  end

  def set_distance_away
    self.distance_away = ((game.treasure_x.to_i - game.current_position[0]).abs + (game.treasure_y.to_i - game.current_position[1]).abs)  * 100
  end

  def win()
    self.winner = true
    self.game.winning_distance = distance_away.to_i
    game.save()
  end

  def keep_playing()
    self.winner = false
    game.save()
  end
end
