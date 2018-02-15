module My
  class ChatsController < BaseController
    skip_before_action :verify_authenticity_token
    def messages
      chat = current_user.chats.find(params[:id])
      chat.user_in_chats.find_by_user_id(current_user.id).reset_unread_messages
      render json: chat.messages.order(:created_at)
    end

    def create
      t = CreateChat.new
      result = t.call(u1_id: current_user.id, u2_id: params[:user_id])
      if result.success?
        render json: result.value
      else
        render json: { error: result.value }
      end
    end

    def add_message
      chat = current_user.chats.find(params[:id])
      msg = chat.messages.create(content: params[:content], user_id: current_user.id)
      render json: msg
    end
  end
end
