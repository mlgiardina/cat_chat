class ChatroomsController < ApplicationController

  def index
    chatroom_list = []
    chatrooms = Chatroom.all
    chatrooms.each do |chatroom|
      chatroom_list.push(chatroom.name.gsub(/_/, ' '))
    end
    render json: chatroom_list
  end

  def show
    begin
      current_chatroom = []
      chatroom_messages = Chatroom.where(name: params[:chatroom].parameterize.underscore).first.messages
      recent_chatroom_messages = chatroom_messages.select { |message| message.created_at > (Time.now - 300) }
      recent_chatroom_messages.each do |message|
        message_object = {}
        message_object["user"] = User.find(message.user).name
        message_object["message"] = message.message
        message_object["created_at"] = message.created_at
        current_chatroom.push(message_object)
      end
      render json: current_chatroom
    rescue ActiveRecord::RecordNotFound => error
      render json: { error: error.message }, status: 404
    rescue StandardError => error
      render json: { error: error.message }, status: 422
    end
  end

end
