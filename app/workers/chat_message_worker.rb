class ChatMessageWorker
  include Sidekiq::Worker

  def perform(id)
    mes = Message.find(id)
     ActionCable.server.broadcast(
      "chat_#{mes.chat_id}",
      message: mes
    )
  end
end
