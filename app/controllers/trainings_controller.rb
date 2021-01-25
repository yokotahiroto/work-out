class TrainingsController < ApplicationController

  def new
    @training = Training.new
  end

  def index
    @trainings = Training.all
  end

  def show
    @training = Training.find(params[:id])
  end

  def create
    @training = Training.new(training_params)
    @training.user_id = current_user.id
    byebug
    if @training.save
      redirect_to trainings_path, notice: 'You have create book successfully'
    else
      render :'users/show'
    end
  end

  private

  def training_params
    params.require(:training).permit(
      :post_image_id,
      :day,
      :time,
      :meal,
      :run,
      :memo,
      :weight,
      muscle_ids: [],
      )
  end
end
