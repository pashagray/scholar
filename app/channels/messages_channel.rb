class MessagesChannel < ApplicationCable::Channel
  def subscribed
    if params[:chat_id].match?(/current_chat=\d+/)
      stream_from "messages_channel_#{params[:chat_id].split(/=/).last}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
