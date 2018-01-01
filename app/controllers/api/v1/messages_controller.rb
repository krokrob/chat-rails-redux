class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    @messages = @channel.messages.order(created_at: :asc).map do |msg|
      message = {
        id: msg.id,
        author: msg.user.email.match(/(.+)@/)[1],
        content: msg.content,
        created_at: msg.created_at
      }
    end
    render json: @messages
  end

  def create

    @message = Message.new(message_params)
    @message.user = current_user
    @message.channel = @channel
    if @message.save
      render json: {
        id: @message.id,
        author: @message.user.email.match(/(.+)@/)[1],
        content: @message.content,
        created_at: @message.created_at
      }
    end
  end

  private

  def set_channel
    @channel = Channel.find_by_name(params[:channel_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
