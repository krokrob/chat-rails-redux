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
  end

  private

  def set_channel
    @channel = Channel.find_by_name(params[:channel_id])
  end
end
