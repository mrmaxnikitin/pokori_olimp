class RewardsController < ApplicationController
  before_action :find_reward, except: [:index, :new, :create, :activate_diploma, :get_activate_diploma]
  before_action :require_admin, only: [:activate_diploma]

  def index
    @rewards = Reward.order(created_at: "DESC").all
  end

  def show
    if @reward.paid
      case @reward.prize
      when 0
         prize = 'Участника'
      when 1
         prize = 'I степени'
      when 2
         prize = 'II степени'
      when 3
         prize = 'III степени'
      end
      
      @output_diploma = @reward.diploma_number1(920, prize, @reward.number)
    end
  end

  def create
    if logged_in?
      @reward = current_user.rewards.create reward_params
    else
      @reward = Reward.create reward_params
    end
    render nothing: true
  end

  def activate_diploma
    @reward = Reward.new
  end
  def get_activate_diploma
    @reward = Reward.find(params[:reward][:id])
    if @reward.update(paid: true)
      flash[:success] = 'Отлично!'
    else
      flash[:error] = "Провал"
    end
    redirect_to activate_diploma_path
  end

  private
    def reward_params
      params.require(:reward).permit(
        :name, :age, :institution, :prize, :score, :contest_id, :number)
    end

    def find_reward
      @reward = Reward.find(params[:id])
    end
end
