class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create ]

  def new
    @user = User.new
  end


  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def create
    @user = User.new user_params
    @user.access_level=0;
    if @user.save
      redirect_to root_path, notice: "Sign Up completed! Please Login."
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name,:last_name,:password, :password_confirmation)
  end
end
