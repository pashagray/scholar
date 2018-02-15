module My
  class MessengerController < BaseController
    def index
      @users = User.not_chating_with(current_user)
      @chats = current_user
        .chats
        .includes(:messages)
        .order_by_relevance
        .map do |chat|
          {
            id: chat.id,
            title: chat.title(current_user), 
            unread: UserInChat.find_by(user_id: current_user.id, chat_id: chat.id).unread_messages,
            last_message: chat.messages.order(:created_at).last.try(:content).try(:truncate, 30) || 'Нет сообщений'
          }
        end
    end
  end
end
