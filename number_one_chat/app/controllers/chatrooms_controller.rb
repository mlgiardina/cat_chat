class ChatroomsController < ApplicationController

  def index
    render json: Chatroom.all
  end

  def show
    current_chatroom = []
    chatroom_messages = Chatroom.where(name: params[:chatroom]).first.messages
    recent_chatroom_messages = chatroom_messages.select { |message| message.created_at > (Time.now - 300) }
    recent_chatroom_messages.each do |message|
      message_object = {}
      message_object["user"] = User.find(message.user).name
      message_object["message"] = message.message
      message_object["created_at"] = message.created_at
      current_chatroom.push(message_object)
    end
    render json: current_chatroom
  end

end
