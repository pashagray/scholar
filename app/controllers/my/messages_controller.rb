module My
  class MessagesController < BaseController
    def create
      message = Message.new(message_params)
      message.user_id = current_user.id
      message.attachment = message_params[:attachment]
      if message.save
        target_chat_member = message.chat.chat_members.where.not(user_id: current_user.id).first
        target_user = User.find(target_chat_member.user_id)
        ActionCable.server.broadcast("messages_channel_#{message.chat_id}",
                                     chat_id: message.chat_id,
                                     message: message.content,
                                     sender_avatar_url: current_user.avatar.thumb.url,
                                     created: message.created_at,
                                     attachment: message.attachment.messenger.url)
      end
      redirect_to my_chats_path(current_chat: message.chat_id)
    end

    private

    def message_params
      params.require(:message).permit(:content, :chat_id, :user_id, :attachment)
    end
  end
end
