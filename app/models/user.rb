class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_one :game, dependent: :destroy

  def treasure_found? 
    game.present? and game.winning_distance.present? 
  end
  
  def missed_the_mark? 
    game.present? and !game.moves.last.winner 
  end

  def started_the_hunt?
    game.present? and game.winning_distance.blank?
  end

  def start_game?; game.blank?; end;
end
