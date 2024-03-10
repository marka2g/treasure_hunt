class Game < ApplicationRecord
  belongs_to :user
  has_many :moves

  with_options presence: true do
    validates :board_size
    validates :user
  end
end
