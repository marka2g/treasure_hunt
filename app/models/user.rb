class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_one :game, dependent: :destroy

  def already_found_treasure? 
    game.present? and game.winning_distance.present? 
  end

  def started_the_hunt?
    game.present? and game.winning_distance.blank?
  end

  def start_game?; game.blank?; end;
end
