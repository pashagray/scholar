module My
  class MessagesController < BaseController
    protect_from_forgery with: :exception

    def create
      @message = Message.new(message_params)
      @message.author_id = current_user.id
      @message.attachment = message_params[:attachment]
      if @message.save
        # target_chat_member = @message.chat.users.where.not(id: current_user.id).first
        # target_user = User.find(target_chat_member.id)
        ActionCable.server.broadcast("messages_channel_#{@message.chat_id}", send_params)
        update_message_count
      end
      redirect_to my_chats_path(current_chat: @message.chat_id)
    end

    private

    def message_params
      params.require(:message).permit(:content, :chat_id, :user_id, :attachment)
    end

    def send_params
      { chat_id: @message.chat_id,
        message: @message.content,
        sender_avatar_url: current_user.avatar.thumb.url,
        created: l(@message.created_at, format: :short),
        img_attachment: @message&.attachment&.messenger&.url,
        attachment: @message&.attachment&.url,
        attachment_title: @message&.attachment&.file&.filename }
    end

    def update_message_count
      chat_id = @message.chat_id
      user_ids = Chat.find(chat_id).users.where.not(id: @message.author_id).pluck(:id)
      user_ids.each do |u_id|
        total_unread = User.find(u_id).unread_count
        ActionCable.server.broadcast("users_channel_#{u_id}", { chat_id: @message.chat_id, user_id: u_id, total_unread: total_unread })
      end
    end
  end
end
