class Game < ApplicationRecord
  include TreasureHunt::HiddenLocation
  
  attr_accessor :current_position
  attr_reader :board, :treasure_map #, :winning_distance
  
  validates :email, presence: true
  validates :board_size, presence: true

  before_create :set_up

  def to_s
    "The game board:\n#{@board}"
  end

  def move(move_coords)
    record_move(move_coords)
    winning_move?(move_coords) ? win(move_coords) : keep_playing(move_coords)
  end

private

  def set_up
    @board = build_board()
    treasure_coords = x_y_ary(self.board_size - 1)
    @treasure_map = Treasure.new(@board[treasure_coords[0]][treasure_coords[1]], treasure_coords)
    self.current_position = [0, 0]
  end

  # method needed to stub in the test
  def x_y_ary(size)
    [rand(0..19), rand(0..19)]
  end

  def build_board
    (1..self.board_size*self.board_size).each_slice(self.board_size).to_a
  end

  def record_move(move_coords)
    calculate_current_position(move_coords)
    self.move_history <<= move_coords
  end

  def distance_from_treasure
    ((self.current_position[0] - @treasure_map.coords[0]).abs + (self.current_position[1] - @treasure_map.coords[1]).abs)  * 100
  end

  def winning_move?(move_coords)
    distance_from_treasure() < 1000
  end

  def calculate_current_position(coords)
    self.current_position = [self.current_position[0] += coords[0], self.current_position[1] += coords[1]]
  end

  def win(move_coords)
    dist = distance_from_treasure()
    update({winning_distance: dist})
    [true, "The treasure is #{dist} meters away - you win!"]
  end

  def keep_playing(move_coords)
    [false, "Sorry, you are #{distance_from_treasure()} meters away. Try again."]
  end

end
