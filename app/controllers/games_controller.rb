class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, except: [:play]

  def index
  end
  # def index
  #   @blog_posts = user_signed_in? ? BlogPost.sorted : BlogPost.published.sorted
  #   @pagy, @blog_posts = pagy(@blog_posts)
  # rescue Pagy::OverflowError
  #   redirect_to root_path(page: 1)

  #   # params[:page] = 1
  #   # retry
  # end


  def show
  end
  # def show
  # end

  def new
  end
  # def new
  #   @blog_post = BlogPost.new
  # end


  def create
  end
  # def create
  #   @blog_post = BlogPost.new(blog_post_params)
  #   if @blog_post.save
  #     redirect_to @blog_post
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # # https://guides.rubyonrails.org/working_with_javascript_in_rails.html
  # def create
  #   @post = Post.new(post_params)

  #   respond_to do |format|
  #     if @post.save
  #       format.turbo_stream
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #     end
  #   end
  # end


  def edit
  end
  # def edit
  # end

  def update
  end
  # def update
  #   if @blog_post.update(blog_post_params)
  #     redirect_to @blog_post
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  def destroy
  end
  # def destroy
  #   @blog_post.destroy
  #   redirect_to root_path
  # end

  # ----------------------------------------------

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
