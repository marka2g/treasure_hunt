class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, except: [:play]

  def play
    @game = Game.create(email: current_user.email, board_size: 20)
    @winners = Game.ranked()
  end

  def move
    winning_move, message = @game.move([params[:north_south].to_i, params[:east_west].to_i])
    @game.save

    respond_to do |format|
      if winning_move
        format.html { redirect_to win_path(@game), win: message }
        # format.html { redirect_to "/win/#{@game.id}", win: message }
      else
        # format.html { redirect_to "/games/#{@game.id}/move", miss: message }
        # format.html { redirect_to move_path(@game), miss: message }
        format.html { redirect_to make_move_path(@game), miss: message }
      end
    end
  end

private
  def game_params
    params.require(:game).permit(:id, :east_west, :north_south)
  end

  def set_game
    @game = Game.find(params[:id])
    @winners = Game.ranked()
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path 
  end
end
