class TrainingsController < ApplicationController

  def new
    @training = Training.new
  end

  def index
    @trainings = Training.all
  end

  def show
    @training = Training.find(params[:id])
    @user = @training.user
    @training_comment = TrainingComment.new
    #新着順で表示
    @training_comments = @training.training_comments.order(created_at: :desc)
  end
  
  def edit
    @training = Training.find(params[:id])
    if @training.user == current_user
       render "edit"
    else
       redirect_to trainings_path
    end
  end

  def create
    @training = Training.new(training_params)
    @training.user_id = current_user.id
    if @training.save
      redirect_to trainings_path, notice: 'You have create book successfully'
    else
      render :'users/show'
    end
  end
  
  def update
    @training = Training.find(params[:id])
    @training.update(training_params)
    @training.user_id = current_user.id
    if @training.save
        redirect_to training_path(@training.id), notice:'You have update book successfully'
    else
        render :edit
    end
  end
  
  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    redirect_to trainings_path
  end

  private

  def training_params
    params.require(:training).permit(
      :post_image,
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
