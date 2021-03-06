class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @courses = Course.all

  end

  def new
	@user = User.new

  end
  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
	  flash[:success] = "Welcome to the CS Matriculation App!"
	  redirect_to @user
    else
      render 'new'
    end
  end



  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
