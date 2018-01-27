module My
  class ChatsController < BaseController
    def index
      @chats = current_user.chats
      @users = User.all
      @current_chat = Chat.find(params[:current_chat]) if params[:current_chat]
    end

    def show
      # use cancancan
      @chat = Chat.first.chat_members.where('user_id IN (?)', params[:user_ids])
    end

    def create
      title = User.find(chat_params[:user_ids]).full_name
      newchat = Chat.create!(title: title)
      ChatMember.find_or_create_by(chat_id: newchat.id, user_id: current_user.id)
      ChatMember.find_or_create_by(chat_id: newchat.id, user_id: chat_params[:user_id])
      redirect_to my_chats_path(current_chat: newchat.id)
    end

    private

    def chat_params
      params.require(:chat).permit(:title, :user_ids)
    end
  end
end
