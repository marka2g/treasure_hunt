class Move < ApplicationRecord
  belongs_to :game

  with_options presence: true do
    validates :x
    validates :y
  end
end
