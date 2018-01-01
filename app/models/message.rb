class Message < ApplicationRecord
  after_create :broadcast_message

  belongs_to :user
  belongs_to :channel

  validates :content, presence: true, allow_blank: false

  def broadcast_message
    ActionCable.server.broadcast("chat_room_#{channel.name}", {
      message: self.to_json
    })
  end
end
