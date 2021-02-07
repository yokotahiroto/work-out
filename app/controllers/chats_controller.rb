class ChatsController < ApplicationController
  def index
    @my_chats = current_user.chats
    @chat_partners = User.where.not(id:current_user.id)#自分以外
    # @last_messege = Chat.find_by(sentence: (updated_at: :desc).limit(1))
  end

  def show
    @partner = User.find(params[:id])
    @chats_by_myself = Chat.where(user_id: current_user.id,partner_id: @partner.id)
    @chats_by_other = Chat.where(user_id: @partner.id,partner_id: current_user.id)
    @chats = @chats_by_myself.or(@chats_by_other)#リレーションオブジェクト達を結合する
    @chats = @chats.order(:created_at)
  end
  
  private
  
  def chat_params
    params.require(:chat).permit(:user_id, :partner_id, :sentence)
  end
end
