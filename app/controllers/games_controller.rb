class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: %i[ show ]

  # GET /games or /games.json
  def index
    @pagy, @winners = pagy(Game.ranked())
  end

  def play
    respond_to do |format|
      case 
      when current_user.treasure_found?
        format.html { redirect_to games_path(), notice: "💎 The treasure is #{@game.moves.last.distance_away.to_i} meters away - you win! 💎" }
      when current_user.started_the_hunt?
        @game = current_user.game
        format.html { render :play, notice: "Happy Hunting!" }
      when current_user.start_game?
        @game = Game.create({user: current_user, board_size: 20})
        format.html { render :play, notice: "Happy Hunting!" }
      end
    end
  end

  def show
    respond_to do |format|
      case 
      when current_user.treasure_found?
        GamesMailer.winner(@game).deliver_later
        format.html { redirect_to games_path(), win: "💎 The treasure is #{@game.moves.last.distance_away.to_i} meters away - you win! 💎" }
      when current_user.missed_the_mark?
        format.html { redirect_to play_game_path(), miss: "🙅🏽‍♂️ Sorry, you are #{@game.moves.last.distance_away.to_i} meters away. Try again. 🙅🏽‍♂️" }
      else
        
      end
    end
  end

private
  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:id)    
  end
end
