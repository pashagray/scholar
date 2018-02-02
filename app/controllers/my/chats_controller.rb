module My
  class ChatsController < BaseController
    def index
      binding.pry
      @chats = current_user.chats
      @users = User.alphabetical_order
      @current_chat = Chat.find(params[:current_chat]) if params[:current_chat] && chat_member?(params[:current_chat])
    end

    def show
      # TODO use cancancan and add some privacy
      # ???
      @chat = Chat.joins(:users).where('users.id IN (?)', params[:user_ids])
    end

    def create
      user = chat_params[:user_id].to_i
      if chat_exists(user)
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
        Chat.joins(:users).where('users.id = ? && users.id = ?', user_id, current_user).first.id
      end
    end

    def chat_member?(chat_id)
      current_user.id.in?Chat.find(chat_id).users.pluck('users.id')
    end
  end
end
