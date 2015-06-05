class MessagesController < ApplicationController

  def index
    message_object = Message.all
    blah = []
      message_object.each do |message|
        deliverable = {}
        deliverable["user"] = message.user.name
        deliverable["chatroom"] = message.chatroom.name
        deliverable["message"] = message.message
        blah.push(deliverable)
      end
    render json: blah
  end

  def create
    begin
      render json: Message.create(user_id: User.find_or_create_by(name: params[:user]).id, chatroom_id: Chatroom.where(name: params[:chatroom]).first.id, message: params[:message])
    rescue ActiveRecord::RecordNotFound => error
      render json: { error: error.message }, status: 404
    rescue StandardError => error
      render json: { error: error.message }, status: 422
    end
  end

  def display_stats
  end
end
