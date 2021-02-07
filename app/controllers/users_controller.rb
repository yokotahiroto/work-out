class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @training = @user.trainings
    @current_user = current_user
    @data = @training.pluck(:start_time, :weight)
    @time_total = @training.all.sum(:time)
  end

  def index
    if params[:user].present?
      if params[:user].empty?
        @users = User.all
      else
        @users = User.where('name LIKE(?)', "%#{params[:user][:keyword]}%")
      # render json: @users
      end
    else
      @users = User.all
    end
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
  
  def user_favorite
    @user_favorite = User.find_by(id: params[:id])
    @favorites = Favorite.where(user_id: @user_favorite.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
