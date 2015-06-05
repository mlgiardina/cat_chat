class MessagesController < ApplicationController

  def index
    messages_object = Message.all
     all_messages = []
      messages_object.each do |message|
        deliverable = {}
        deliverable["user"] = message.user.name
        deliverable["chatroom"] = message.chatroom.name
        deliverable["message"] = message.message
        all_messages.push(deliverable)
      end
    render json: all_messages
  end

  def create
    begin
      new_message = Message.create(user_id: User.find_or_create_by(name: params[:user]).id, chatroom_id: Chatroom.find_or_create_by(name: params[:chatroom]).id, message: params[:message])
      render json: { user: new_message.user.name, chatroom: new_message.chatroom.name, message: new_message.message }
    rescue ActiveRecord::RecordNotFound => error
      render json: { error: error.message }, status: 404
    rescue StandardError => error
      render json: { error: error.message }, status: 422
    end
  end

  # def display_stats
  #   users = []
  #   User.each do |user|
  #     user.messages.count
  #   topTenUsers =
  #   render json: { mostPopularChatroom, topTenUsers, recentlyActiveUsers }
  # end
end
