class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: %i[ show edit update destroy ]

  # GET /games or /games.json
  def index
    @winners = Game.ranked()
  end

  def play
    respond_to do |format|
      case 
      when current_user.already_found_treasure?
        format.html { redirect_to games_path(), notice: "Treasure found. Did you already spend it all?" }
      when current_user.started_the_hunt?
        @game = current_user.game
        format.html { render :play, notice: "Happy Hunting!" }
      when current_user.start_game?
        @game = Game.create({user: current_user, board_size: 20})
        format.html { render :play, notice: "Happy Hunting!" }
      end
    end
  end

  # GET /games/1 or /games/1.json
  def show
  end

  # GET /games/1/edit
  def edit
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_url(@game), notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # REMOVE
  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy!
    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
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
