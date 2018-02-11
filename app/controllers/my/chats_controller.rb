module My
  class ChatsController < BaseController
    def index
      @chats = current_user.chats.by_messages + current_user.chats.without_messages
      @users = users_no_chat
      @current_chat = Chat.find(params[:current_chat]) if params[:current_chat] && chat_member?(params[:current_chat])
      if @current_chat.present?
        @current_chat.messages.each do |m|
          MessagesUser.find_or_create_by(user: @current_user, message: m, chat_id: @current_chat.id)
        end
      end
    end

    def create
      user = chat_params[:user_id].to_i
      if chat_exists(user).present?
        flash[:error] = 'Чат уже существует, вот он:'
        redirect_to my_chats_path(current_chat: chat_exists(user))
      else
        # title = User.find(chat_params[:user_id]).full_name if chat_params[:user_id]
        @new_chat = Chat.create!(user_ids: [chat_params[:user_id], current_user.id])
        broadcast_new_chat if @new_chat
        redirect_to my_chats_path(current_chat: @new_chat.id)
      end
    end

    private

    def chat_params
      params.require(:chat).permit(:title, :user_id)
    end

    def chat_exists(user_id)
      # TODO
      if user_id.in?(Chat.joins(:users).pluck('users.id'))
        Chat.joins(:users).where('users.id = ? AND users.id = ?', user_id, current_user).first&.id
      end
    end

    def chat_member?(chat_id)
      current_user.id.in?Chat.find(chat_id).users.pluck('users.id')
    end

    def users_no_chat
      ids = current_user.chats.joins(:users).pluck('users.id')
      if ids.present?
        User.alphabetical_order.where('id NOT IN (?)', ids)
      else
        User.alphabetical_order.where('id != ?', current_user.id)
      end
    end

    def broadcast_new_chat
      fellow = @new_chat.users.where.not(id: current_user.id).first
      user_avatar = fellow&.avatar&.thumb&.url
      new_chat_params = { chat_id: @new_chat.id,
                          user_avatar: user_avatar,
                          author_id: @current_user.id,
                          # chat_title: @new_chat.title}
                          chat_title: @current_user.full_name }
      users = @new_chat.users.where.not(id: @current_user.id).pluck(:id)
      users.each do |u_id|
        ActionCable.server.broadcast("users_channel_#{u_id}", new_chat_params)
      end
    end
  end
end
