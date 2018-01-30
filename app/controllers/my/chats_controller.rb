module My
  class ChatsController < BaseController
    def index
      @chats = current_user.chats
      @users = User.alphabetical_order
      @current_chat = Chat.find(params[:current_chat]) if params[:current_chat]
    end

    def show
      # TODO use cancancan and add some privacy
      @chat = Chat.first.chat_members.where('user_id IN (?)', params[:user_ids])
    end

    def create
      # TODO redirect to chat if exists instead of new
      title = User.find(chat_params[:user_ids]).full_name if chat_params[:user_ids]
      newchat = Chat.create(title: title, user_ids: [params[:user_id], current_user.id])
      # Chat.joins(:users).pluck('users.id')
      redirect_to my_chats_path(current_chat: newchat.id)
    end

    private

    def chat_params
      params.require(:chat).permit(:title, :user_ids)
    end
  end
end
