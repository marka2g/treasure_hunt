class Game < ApplicationRecord
  belongs_to :user
  has_many :moves, dependent: :destroy

  encrypts :board_size, :treasure_x, :treasure_y, :plot_number

  before_create :set_up_board

  with_options presence: true do
    validates :board_size
    validates :user_id
  end

  scope :ranked, -> { where.not(winning_distance: nil).order(winning_distance: :asc) }

  # this is here to stub in tests
  def random_coords(size)
    [rand(0..size-1), rand(0..size-1)]
  end

private

  def set_up_board
    self.treasure_x, self.treasure_y = random_coords(self.board_size.to_i - 1)
    self.plot_number = build_board()[self.treasure_x.to_i][self.treasure_y.to_i]
    self.current_position = [0, 0]
  end

  def build_board
    (1..self.board_size.to_i*self.board_size.to_i).each_slice(self.board_size.to_i).to_a
  end
end
