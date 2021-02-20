class TrainingsController < ApplicationController

  def new
    @training = Training.new
  end

  def index
    @trainings = Training.includes(:favorited_users).limit(10).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
  end
  
  def timeline
    @feeds = Training.where(user_id: [current_user.id, *current_user.following_user.ids]).order(created_at: :desc)
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
    training = Training.new(training_params)
    training.user_id = current_user.id
    #ファイルが存在した時
    if training.save && params[:training][:post_image].is_a?(ActionDispatch::Http::UploadedFile)
      tags = Vision.get_image_data(training.post_image)
        tags.each do |tag|
          training.tags.create(name: tag)
        end
      redirect_to timeline_training_path(current_user.id),notice: "トレーニングを投稿しました"
    # ファイルが存在しなかった時
    elsif training.save && params[:training][:post_image].is_a?(String)
      redirect_to timeline_training_path(current_user.id),notice: "トレーニングを投稿しました"
    else
      render :new
    end
  end
  
  def update
    @training = Training.find(params[:id])
    @training.update(training_params)
    @training.user_id = current_user.id
    if @training.save
        redirect_to training_path(@training.id),notice: "トレーニングを更新しました"
    else
        render :edit
    end
  end
  
  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    flash[:notice] = "トレーニングを削除しました"
    redirect_to user_path(current_user)
  end

  private

  def training_params
    params.require(:training).permit(
      :post_image,
      :time,
      :meal,
      :run,
      :memo,
      :weight,
      :start_time,
      muscle_ids: [],
      )
  end
end
