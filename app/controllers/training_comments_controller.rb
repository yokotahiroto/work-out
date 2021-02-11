class TrainingCommentsController < ApplicationController
    def create
      @training = Training.find(params[:training_id])
      #投稿に紐づいたコメントを作成
      @training_comment = @training.training_comments.build(training_comment_params)
      @training_comment.user_id = current_user.id
      @training_comment.save
      
      @training_comments = @training.training_comments
      render 'index.js.erb'
    end

    def destroy
      @training_comment = TrainingComment.find(params[:id])
      # 削除前にtrainingを取得する
      training = @training_comment.training
      @training_comment.destroy
      
      # 先に取得しておいたtrainingをもとに削除した後のcommentのリストを取得
      @training_comments = training.training_comments
      
      render 'index.js.erb'
    end

    private
    def training_comment_params
      params.require(:training_comment).permit( :comment, :training_id, :user_id)
    end
end
