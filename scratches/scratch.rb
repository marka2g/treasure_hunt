# Game Tests from UI

# x: 17, y: 8, plot: 349
# Test 1 -> x: 8, y: 16, plot: 177
# current_position: [0, 0]

[1, 1] # move 1
  # current_position: [1, 1]
  

flash.each {|type, msg| "#{type} #{msg}"}


# x: 12, y: 18, plot: 259


# win erb - wkg
<h1>Score Board</h1>

<% @winners.each do |game| %>
  <div class="flex">
    <div>
      <%= game.email %>
    </div>
    <div>
      <%= game.winning_distance %>
    </div>
  </div>
<%# end %>
# win erb - wkg - end

def move
  winning_move, message = @game.move([params[:north_south].to_i, params[:east_west].to_i])
  
  # respond_to do |format|
  #   if winning_move
  #     @game.save
  #     format.html { redirect_to game_start_path, win: message }
  #   else
  #     format.html { redirect_to move_path(@game), miss: message } 
  #   end
  # end

  respond_to do |format|
    if winning_move
binding.pry
      @game.save
      format.html { redirect_to win_path, win: message }
    else
      format.html { redirect_to move_path(@game), miss: message } 
    end
  end

end







rails db:migrate:reset
rails db:seed

# Test Game - Logic fukd

rails console -e test

# from pragstud ruby 

test_boosts_the_player_if_a_high_number_is_rolled
  @game.add_player(@player_1)

  @game.stub(:roll_die, 6) do
    @game.play
    assert_equal 75, @player_1.health
  end
end

# public method
def roll_die
  number = rand(1..6)
  audit(number)
  number
end



# HUGE POINT - game logic is doing simple subtract math to cal distance, that may not be correct !!!!

#  x: 4, y: 13, plot: 94

# winning game
game = Game.create(email: "hunter@example.com", board_size: 20)

# backwards logic 
  # if cp[x] == 0 
  # if cp[y] == 0   
    # -> NO NEG

# test backwards
# Test 6 -> x: 15, y: 15, plot: 316
game.move([6, 6]) # move 1
  # current_position: [6, 6]
  # (15 - 6) -> 9, (15 - 6) -> 9 -> 9 + 9 == 18
  # => [false, "🙅🏽‍♂️ Sorry, you are 1800 meters away. Try again. 🙅🏽‍♂️"]
# TEST BACKWARDS
game.move([-7, 0]) # move 2
  # EXPECT: current_position: [0, 6]
  # RESULT: current_position: [-1, 6]   -   not yet BUG
    # (15 -- 1) -> 16, (15 - 6) -> 9 -> 16 + 9 == 25
    # => [false, "🙅🏽‍♂️ Sorry, you are 2500 meters away. Try again. 🙅🏽‍♂️"]
game.move([16, -1]) # move 3 ->  current_position: [15, 5]
  # (15 - (16 - 1)) -> 0, (15 - (6 - -1)) -> 5 == 15 - 5 -> 10
  # => [false, "🙅🏽‍♂️ Sorry, you are 1000 meters away. Try again. 🙅🏽‍♂️"]
game.move([0, 2]) # move 3 ->  current_position: [15, 7]
  # [true, "💎 The treasure is 800 meters away - you win! 💎"]

# Test 5 -> x: 12, y: 17, plot: 258
game.move([0, 6]) # move 1
  # current_position: [0, 6]
  # 12 + 11 == 23
  # => [false, "🙅🏽‍♂️ Sorry, you are 2300 meters away. Try again. 🙅🏽‍♂️"]
game.move([12, 5]) # move 2
  # 0 + 6 == 6
  # current_position: [12, 11]
  # => [true, "💎 The treasure is 600 meters away - you win! 💎"]


# Test 4 -> x: 5, y: 16, plot: 117
game.move([1, 1]) # move 1
  # => [false, "🙅🏽‍♂️ Sorry, you are 1900 meters away. Try again. 🙅🏽‍♂️"]
  # (5 - 1) -> 4, (16 - 1) -> 15  -> 19 * 100 == 1900
game.move([1, 1]) # move 2
  # current_position: [2, 2]
  # [false, "🙅🏽‍♂️ Sorry, you are 1700 meters away. Try again. 🙅🏽‍♂️"]
game.move([1, 1]) # move 3
  # current_position: [3, 3]
  # dist should be: [(5 - 3), (16 - 3)] -> [2, 13] -> 1500
  # => [false, "🙅🏽‍♂️ Sorry, you are 1500 meters away. Try again. 🙅🏽‍♂️"]
game.move([1, 1]) # move 4
  # current_position: [4, 4]
  # dist should be: [(5 - 4), (16 - 4)] -> [1, 12] -> 1300
  # => [false, "🙅🏽‍♂️ Sorry, you are 1300 meters away. Try again. 🙅🏽‍♂️"]
game.move([0, 4]) # move 5
  # current_position: [4, 7]
  # dist should be: [(5 - 4), (16 - 4)] -> [1, 8] -> 900
  # => [true, "💎 The treasure is 900 meters away - you win! 💎"]






# Test 3 -> x: 13, y: 0, plot: 261
game.move([1, 1])
# => [false, "🙅🏽‍♂️ Sorry, you are 1300 meters away. Try again. 🙅🏽‍♂️"]


# Test 2 -> x: 1, y: 2, plot: 23
game.move([1, 1])
# => [true, "💎 The treasure is 100 meters away - you win! 💎"]


# Test 1 -> x: 11, y: 1, plot: 222

# given
# 1. MOVE -> tcords [11, 1]
game.move([1, 1])
# current_position: [1, 1]
# [false, "🙅🏽‍♂️ Sorry, you are 1000 meters away. Try again. 🙅🏽‍♂️"]

c == [0, 0] / coords == [1, 1] -> cp == [0 + 1, 0 + 1] -> [1, 1]
# 1. [1, 1] -> dist_to_t_coords [10, 0] -> 1000
# CORRECT 
  # [false, "🙅🏽‍♂️ Sorry, you are 1000 meters away. Try again. 🙅🏽‍♂️"]
  
# POSSIBLE bug - y stays at 0 because of .abs - is that correct?

# given
# 2. MOVE [1, 1]
# 2. curr [2, 2] -> dist_to_t_coords: [11, 1] - [2, 2] == [9, 0] -> 900

# BUG - expecting 900
# distance to treasure: 1000
# distance to treasure: 1000





# old
# c == [1, 1] / coords == [2, 2] -> cp == [1 + 2, 1 + 2] -> [3, 3]
# c == [3, 3] / coords == [3, 3] -> cp == [2 + 3, 2 + 3] -> [5, 5]


game.move([0, -15])

# coords=[9, 4]
# game = TreasureHunt::Game.new(options)
game.move([1, 1])
# @current_position=[1, 1]
game.move([1, 1])
#  @current_position=[2, 2]
game.move([7, 1])
# @current_position=[9, 3]
game.move([1, 1])
# @current_position=[10, 4]
game.move([-1, 1])
# @current_position=[9, 5]

# coords=[18, 9]
# test - it should support forward
# game = TreasureHunt::Game.new(options)
game.move([7, 9])
game.move([0, 1])
game.move([0, -2])
game.move([0, -2])
# current_position=[7, 6]



# first db: seed
# x: 8, y: 6, plot: 167
# x: 17, y: 19, plot: 360
# x: 10, y: 18, plot: 219
# x: 7, y: 3, plot: 144










<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>

<section>
  <p class="alert"><%= alert %></p>
  <p class="notice"><%= notice %></p>
  <%= render "layouts/flash" %>
</section>

<p class="relative block w-full p-4 mb-4 text-base leading-5 text-white bg-green-500 rounded-lg opacity-100 notice font-regular"><%= notice %></p>
<p class="relative block w-full p-4 mb-4 text-base leading-5 text-white bg-red-500 rounded-lg opacity-100 alert font-regular"><%= alert %></p>

class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :email, default: "", null: false
      t.string :board_size, default: "", null: false
      t.string :plot_location, default: "", null: false
      t.string :treasure_x, default: "", null: false
      t.string :treasure_y, default: "", null: false
      t.integer :current_position, array: true, default: [0, 0]
      t.integer :move_history, array: true, default: []
      t.integer :winning_distance

      t.timestamps
    end
  end
end
class Game < ApplicationRecord
  validates :email, presence: true
  validates :board_size, presence: true
  encrypts :board_size, :treasure_x, :treasure_y, :plot_location
  
  before_create :set_up

  def to_s
    "The game board:\n#{@board}"
  end

  def move(move_coords)
    record_move(move_coords)
    winning_move?(move_coords) ? win(move_coords) : keep_playing(move_coords)
  end

private

  def set_up
    self.treasure_x, self.treasure_y = x_y_ary(self.board_size.to_i - 1)
    self.plot_location = build_board()[self.treasure_x.to_i][self.treasure_y.to_i]
    # self.current_position, @move_history = [0, 0], []
    self.current_position, self.move_history = [0, 0], []
  end

  # stubbed for test
  def x_y_ary(size)
    [rand(0..19), rand(0..19)]
  end

  def build_board
    (1..self.board_size.to_i*self.board_size.to_i).each_slice(self.board_size.to_i).to_a
  end

  def record_move(move_coords)
    calculate_current_position(move_coords)
# binding.pry
    # self.move_history <<= move_coords
    # move_history <<= move_coords
    # update({move_history: self.move_history <<= move_coords})
    # self.move_history = self.move_history << move_coords
    # update_column(:move_history, self.move_history << move_coords)

    # self.move_history <<= move_coords
    # update({move_history: self.move_history <<= move_coords})
    # update({move_history: [self.move_history] + move_coords})
    # update({move_history: [self.move_history + move_coords]})
binding.pry
    # @move_history <<= move_coords
    self.move_history = self.move_history <<= move_coords
binding.pry
  end

  def distance_from_treasure
    ((self.current_position[0] - self.treasure_x.to_i).abs + (self.current_position[1] - self.treasure_y.to_i).abs)  * 100
  end

  def winning_move?(move_coords)
    distance_from_treasure() < 1000
  end

  def calculate_current_position(coords)
    self.current_position = [self.current_position[0] += coords[0], self.current_position[1] += coords[1]]
  end

  def win(move_coords)
    dist = distance_from_treasure()
    update({winning_distance: dist})
    [true, "The treasure is #{dist} meters away - you win!"]
  end

  def keep_playing(move_coords)
    [false, "Sorry, you are #{distance_from_treasure()} meters away. Try again."]
  end

end












Rails.application.routes.draw do
  patch "/games/:id", to: "games#move"
  # get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post
  get 'games/move'
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  root "games#start"
end


# Rails.application.routes.draw do
#   # patch "/games/:id", to: "games#move"
#   get 'games/move'
#   get "games/:id/win", to: "games#win", as: :win_game 
#   devise_for :users

#   get "up" => "rails/health#show", as: :rails_health_check
#   root "games#start"
# end










rails db:migrate:reset
rails db:seed


t.string "email", null: false
t.string "board_size", default: "", null: false
t.string "plot_location", default: "", null: false
t.string "treasure_coords", default: [], array: true
t.integer "move_history", default: [], array: true
t.integer "winning_distance"
t.datetime "created_at", null: false
t.datetime "updated_at", null: false


# gonna encrypt so need to change field types
# orig 
class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :email
      t.integer :board_size
      t.integer :plot_location
      t.integer :treasure_coords, array: true, default: []
      t.integer :move_history, array: true, default: []
      t.integer :winning_distance

      t.timestamps
    end
  end
end
# gonna encrypt so need to change field types







# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_08_214334) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "email"
    t.integer "board_size"
    t.integer "move_history", default: [], array: true
    t.integer "winning_distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end



# sor of befor chopping block
class Game < ApplicationRecord
  include TreasureHunt::HiddenLocation
  
  attr_accessor :current_position
  attr_reader :board, :treasure_map
  
  validates :email, presence: true
  validates :board_size, presence: true

  encrypts :board_size
  encrypts :treasure_coords
  encrypts :plot_location

  before_create :set_up

  def to_s
    "The game board:\n#{@board}"
  end

  def move(move_coords)
    record_move(move_coords)
    winning_move?(move_coords) ? win(move_coords) : keep_playing(move_coords)
  end

private

  def set_up
    @board = build_board()
    @treasure_coords = x_y_ary(self.board_size - 1)
    @plot_location = @board[@treasure_coords[0]][@treasure_coords[1]]
    # @treasure_map = Treasure.new(@board[treasure_coords[0]][treasure_coords[1]], treasure_coords)
    @current_position = [0, 0]
  end

  # method needed to stub in the test
  def x_y_ary(size)
    [rand(0..19), rand(0..19)]
  end

  def build_board
binding.pry
    (1..self.board_size*self.board_size).each_slice(self.board_size).to_a
  end

  def record_move(move_coords)
    calculate_current_position(move_coords)
    self.move_history <<= move_coords
  end

  def distance_from_treasure
    ((@current_position[0] - @treasure_coords[0]).abs + (@current_position[1] - @treasure_coords[1]).abs)  * 100
  end

  def winning_move?(move_coords)
    distance_from_treasure() < 1000
  end

  def calculate_current_position(coords)
binding.pry
    @current_position = [@current_position[0] += coords[0], @current_position[1] += coords[1]]
  end

  def win(move_coords)
    dist = distance_from_treasure()
    update({winning_distance: dist})
    [true, "The treasure is #{dist} meters away - you win!"]
  end

  def keep_playing(move_coords)
    [false, "Sorry, you are #{distance_from_treasure()} meters away. Try again."]
  end

end

# sor of befor chopping block


# Game - in good state - before tests
class Game < ApplicationRecord
  validates :email, presence: true
  validates :board_size, presence: true
  encrypts :board_size, :treasure_x, :treasure_y, :plot_location

  before_create :set_up

  scope :ranked, -> { where.not(winning_distance: nil).order(winning_distance: :asc) }
  
  def move(move_coords)
    calculate_current_position(move_coords)
    dist = distance_from_treasure()
    # winning_move?(move_coords) ? win(move_coords) : keep_playing(move_coords)
    winning_move?(dist) ? win(dist) : keep_playing(dist)
  end

private

  def set_up
    self.treasure_x, self.treasure_y = x_y_ary(self.board_size.to_i - 1)
    self.plot_location = build_board()[self.treasure_x.to_i][self.treasure_y.to_i]
    self.current_position = [0, 0]

# for test
puts  "x: #{self.treasure_x}, y: #{self.treasure_y}, plot: #{self.plot_location}"
  end

  # stubbed for test
  def x_y_ary(size)
    [rand(0..19), rand(0..19)]
  end

  def build_board
    (1..self.board_size.to_i*self.board_size.to_i).each_slice(self.board_size.to_i).to_a
  end

  def distance_from_treasure
    dtt = ((self.treasure_x.to_i - self.current_position[0]).abs + (self.treasure_y.to_i - self.current_position[1]).abs)  * 100
puts "distance to treasure: #{dtt}"
    dtt
  end

  def winning_move?(dist_to_treasure)
    dist_to_treasure < 1000
  end

  def calculate_current_position(coords)
    self.current_position = [self.current_position[0] += coords[0], self.current_position[1] += coords[1]]
  end

  def win(dist_to_treasure)
    update({winning_distance: dist_to_treasure})
    [true, "💎 The treasure is #{dist_to_treasure} meters away - you win! 💎"]
  end

  def keep_playing(dist_to_treasure)
    [false, "🙅🏽‍♂️ Sorry, you are #{dist_to_treasure} meters away. Try again. 🙅🏽‍♂️"]
  end

end
# Game - in good state - before tests - end













# game test - uugh
require 'minitest/mock'
require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "winning move" do
    game = games(:one)
    Game.stub :x_y_ary, [5, 5] do
      assert_equal [true, "💎 The treasure is 0 meters away - you win! 💎"], game.move([5, 5])
    end
  end
end


# test "the truth" do
  #   assert true
  # end
# assert_equal [@player_1, @player_2], @game.players

# class CompanyTest < ActiveSupport::TestCase
#   test 'foobar' do
#     company = companies(:base)
#     Company.stub :foo, 300 do
#       assert_nil(company.calculate_bar)
#     end
#   end
# end

# game test - uugh - end






# games_controller working
class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, except: [:play]

  def play
puts "IN PLAY"
    @game = Game.create(email: current_user.email, board_size: 20)
    @winners = Game.ranked()
  end

  def move
puts "IN MOVE"

    winning_move, message = @game.move([params[:north_south].to_i, params[:east_west].to_i])

    respond_to do |format|
      if winning_move
        @game.save
        format.html { redirect_to win_path(@game), win: message }
      else
binding.pry
        # format.html { render :move, miss: message }
        # format.html { render "/games/#{@game.id}/move", miss: message }
        # format.html { render move_path(@game), miss: message }
        flash[:miss] = message
        format.html
      end
    end

  end

  # def update
  #   @book = Book.find(params[:id])
  #   if @book.update_attributes(params[:book])
  #     redirect_to(@book)
  #   else
  #     respond_to do |format|
  #       format.html  # edit.html.erb
  #       format.json  { render :json => @team }
  #     end
  #   end
  # end


  def win
puts "IN WIN"
# binding.pry
    # @winners = Game.ranked()
  end

private
  def game_params
    params.require(:game).permit(:game_id, :east_west, :north_south)
    # params.require(:game).permit(:id, :east_west, :north_south)
  end

  def set_game
# binding.pry
    @game = Game.find(params[:game_id])
    # @game = Game.find(params[:id])
    @winners = Game.ranked()
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path 
  end
end

# games_controller working - end

# more games_controller working
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
        # flash.keep(:win)
        # format.html { redirect_to win_path(@game), win: message }
        format.html { redirect_to "/win/#{@game.id}", win: message }
      else
        # flash.now[:miss] = message
        # flash.keep(:miss)
        # flash[:miss] = message
        # redirect_back_or_to({ action: "move", id: @game.id, miss: message })
        # format.html
        flash[:miss] = message
        format.html
      end
    end
  end

  def win
binding.pry
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

# more games_controller working - end 


# path game form - before change to get
<%= form_with url: "/games/#{game.id}/move", method: :patch, class: "flex flex-row gap-4 items-center" do |form| %>
  <%= form.hidden_field :id, value: game.id %>
  <div class="basis-1/3">
    <%= form.label "...north(-) south(+)" %>
    <%= form.number_field :north_south, in: -19..19, class: "number-input"  %>
  </div>
  <div class="basis-1/3">
    <%= form.label "...east(-) west(+)" %>
    <%= form.number_field :east_west, in: -19..19, class: "number-input" %>
  </div>
  <div class="basis-1/3">
    <%= form.button "Move 🚶🏽", class: "submit" %>
  </div>
<% end %>

# path game form - before change to get - end