class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_#{params[:channel_id]}"
  end
end
