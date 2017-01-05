class GamesController < ApplicationController
	before_action :find_game, except: [:index, :new, :create]

	def index
		@games = Game.all
	end

	def show
	end

	def new
		@game = Game.new
	end

	def create
		@game = Game.new game_params
    if @game.save
      redirect_to games_path
    else
      render 'new'
    end
	end

	def edit
	end

	def update
    if @game.update_attributes game_params
      redirect_to game_path
    else
      render 'edit'
    end
	end

	def destroy
		@game.destroy
    redirect_to games_path
	end

	def participate
	end
	
	def get_tasks
		@tasks = @game.tasks.all
		render 'tasks/index', formats: :json
	end

	private
    def find_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:title, :description,
        :category, :subject, :age, :image)
    end
end
