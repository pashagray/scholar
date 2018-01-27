module My
  class MessagesController < BaseController
    def create
      message = Message.new(message_params)
      # if message.save
      #   ActionCable.server.broadcast("messages_#{message_params[:chat_id]}",
      #                                message: message.content,
      #                                user: message.user.username)
      # else
      #   redirect_to chats_path
      # end
    end

    private

    def message_params
      params.require(:message).permit(:content, :chat_id, :user_id, :attachment)
    end
  end
end
