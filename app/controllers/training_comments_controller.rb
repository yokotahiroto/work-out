class TrainingCommentsController < ApplicationController
    def create
      @training = Training.find(params[:training_id])
      #投稿に紐づいたコメントを作成
      @training_comment = @training.training_comments.build(training_comment_params)
      @training_comment.user_id = current_user.id
      @training_comment.save
      render :index
    end

    def destroy
      @training_comment = TrainingComment.find(params[:id])
      @training_comment.destroy
      render :index
    end

    private
    def training_comment_params
      params.require(:training_comment).permit( :comment, :training_id, :user_id)
    end
end
