class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, except: [:start]

  def start
    @game = Game.create(email: current_user.email, board_size: 20)
    # @winnings = Game.winnings()
  end

  def move
binding.pry
    @game.move([params[:north_south].to_i, params[:east_west].to_i])
  end

private
  def game_params
    params.require(:game).permit(:game_id, :east_west, :north_south)
  end

  def set_game
    @game = Game.find(params[:game_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path 
  end
end
