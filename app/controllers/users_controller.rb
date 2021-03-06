class UsersController < InheritedResources::Base

	def index
		@users=User.all
	end

	def new
		@user = User.new
	end

	def create
    @user = User.new user_params
    if @user.save
      auto_login @user
      flash[:success] = "Добро пожаловать! Читайте дневники других педагогов, черпайте материал и вдохновение!"
      redirect_to root_path
    else
      render 'new'
    end
  end

	def edit
	end
	def update
	end

	def destroy
	end

  private
    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end

