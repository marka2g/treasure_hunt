class Game < ApplicationRecord
  validates :email, presence: true
  validates :board_size, presence: true
  encrypts :board_size, :treasure_x, :treasure_y, :plot_location

  before_create :set_up

  scope :ranked, -> { where.not(winning_distance: nil).order(winning_distance: :asc) }
  
  def move(move_coords)
    calculate_current_position(move_coords)
    dist = distance_from_treasure()
    winning_move?(dist) ? win(dist) : keep_playing(dist)
  end

  # public to stub in test
  def x_y_ary(size)
    [rand(0..19), rand(0..19)]
  end

private

  def set_up
    self.treasure_x, self.treasure_y = x_y_ary(self.board_size.to_i - 1)
    self.plot_location = build_board()[self.treasure_x.to_i][self.treasure_y.to_i]
    self.current_position = [0, 0]
# for test
puts  "x: #{self.treasure_x}, y: #{self.treasure_y}, plot: #{self.plot_location}"
  end

  def build_board
    (1..self.board_size.to_i*self.board_size.to_i).each_slice(self.board_size.to_i).to_a
  end

  def distance_from_treasure
    ((self.treasure_x.to_i - self.current_position[0]).abs + (self.treasure_y.to_i - self.current_position[1]).abs)  * 100
  end

  def winning_move?(dist_to_treasure)
    dist_to_treasure < 1000
  end

  def calculate_current_position(coords)
    self.current_position = [self.current_position[0] += coords[0], self.current_position[1] += coords[1]]
  end

  def win(dist_to_treasure)
    update({winning_distance: dist_to_treasure})
    [true, "💎 The treasure is #{dist_to_treasure} meters away - you win! 💎"]
  end

  def keep_playing(dist_to_treasure)
    [false, "🙅🏽‍♂️ Sorry, you are #{dist_to_treasure} meters away. Try again. 🙅🏽‍♂️"]
  end

end
