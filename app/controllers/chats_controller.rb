class ChatsController < ApplicationController
  def index
    @my_chats = current_user.chats
    @all_users = User.where.not(id:current_user.id)
    @chat_partners = []
    @all_users.each do |user|
      if Chat.where(user_id: user.id).where(partner_id: current_user.id).or(Chat.where(partner_id: user.id).where(user_id: current_user.id)).count != 0

        chats_by_myself = Chat.where(user_id: current_user.id,partner_id: user.id)
        chats_by_other = Chat.where(user_id: user.id,partner_id: current_user.id)
        chats = chats_by_myself.or(chats_by_other)#リレーションオブジェクト達を結合する
        chats = chats.order(:created_at)

        @chat_partners.push([user, chats])
      end
    end
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
