module My
  class ChatsController < BaseController
    def index
      @chats = current_user.chats
      @users = users_no_chat
      @current_chat = Chat.find(params[:current_chat]) if params[:current_chat] && chat_member?(params[:current_chat])
      if @current_chat.present?
        @current_chat.messages.each do |m|
          m.read_by << @current_user.id unless @current_user.id.to_s.in?(m.read_by) || @current_user.id == m.user_id
          m.save!
        end
      end
    end

    def create
      user = chat_params[:user_id].to_i
      if chat_exists(user).present?
        flash[:error] = 'Чат уже существует, вот он:'
        redirect_to my_chats_path(current_chat: chat_exists(user))
      else
        title = User.find(chat_params[:user_id]).full_name if chat_params[:user_id]
        new_chat = Chat.create!(title: title, user_ids: [chat_params[:user_id], current_user.id])
        redirect_to my_chats_path(current_chat: new_chat.id)
      end
    end

    private

    def chat_params
      params.require(:chat).permit(:title, :user_id)
    end

    def chat_exists(user_id)
      if user_id.in?(Chat.joins(:users).pluck('users.id'))
        # Chat.joins(:users).where('users.id IN (?)' [1, 2]).first
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
  end
end
