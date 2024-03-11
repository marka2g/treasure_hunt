class MovesController < ApplicationController
  before_action :set_game

  def create
    move = @game.moves.create!(params.required(:move).permit(:x, :y))
    redirect_to @game
  end

private
  def set_game
    @game = Game.find(params[:game_id])
  end
end
