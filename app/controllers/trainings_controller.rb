class TrainingsController < ApplicationController
  
  def new
    @training = Training.new
  end
  
  def index
    @trainings = Training.all
  end
  
  def show
    @training = training.find(params[:id])
  end
  
  def create
  end
  
  private
  
  def training_params
    params.require(:training).permit(:post_image_id, :day, :time, :meal, :run, :memo, :weight)
  end
end
