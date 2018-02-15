class CreateChat
  include Dry::Transaction

  step :find_chat
  step :persist

  def find_chat(input)
    u1 = User.find(input[:u1_id])
    u2 = User.find(input[:u2_id])
    chat = Chat.find_dialog(u1, u2)
    unless chat
      Right(input.merge(u1: u1, u2: u2))
    else
      Left(:chat_exists)
    end
  end

  def persist(input)
    chat = Chat.create
    input[:u1].user_in_chats.create(chat_id: chat.id)
    input[:u2].user_in_chats.create(chat_id: chat.id)
    Right({chat: { id: chat.id, title: input[:u2].full_name, unread: 0, last_message: "Нет сообщений" }})
  end
end
