class UsersController < ApplicationController
  def show
    begin
      requested_messages  = []
      if User.exists?(name: params[:name])
        requested_user = User.where(name: params[:name].downcase).first
        requested_user.messages.each do |message|
          message_info = {}
          message_info["message"] = message.message
          message_info["chatroom"] = message.chatroom.name.gsub(/_/, ' ')
          message_info["created_at"] = message.created_at
          requested_messages.push(message_info)
        end
        render json: { name: requested_user.name, messages: requested_messages }
      else
        raise ActiveRecord::RecordNotFound
      end
    rescue ActiveRecord::RecordNotFound => error
      render json: { error: "The requested user was not found" }, status: 404
    rescue StandardError => error
      render json: { error: error.message }, status: 422
    end
  end

  def index
    render json: User.all
  end
end
