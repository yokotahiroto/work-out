class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @training = @user.trainings
    @current_user = current_user
    @data = @training.pluck(:start_time, :weight)
  end

  def index
    @users = User.all
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
       render :edit
    end
  end

  def following
    @user  = User.find(params[:id])
    render 'show_follow'
  end

  def follower
    @user  = User.find(params[:id])
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
