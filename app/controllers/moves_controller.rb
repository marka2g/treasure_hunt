class MovesController < ApplicationController
  before_action :set_game

  def create
    move = @game.moves.create!(params.required(:move).permit(:x, :y))
    redirect_to @game

    ## notify 
    # win -> [true, "💎 The treasure is #{distance_away.to_i} meters away - you win! 💎"]
    # loose -> [false, "🙅🏽‍♂️ Sorry, you are #{distance_away.to_i} meters away. Try again. 🙅🏽‍♂️"]
  end

private
  def set_game
    @game = Game.find(params[:game_id])
  end
end
