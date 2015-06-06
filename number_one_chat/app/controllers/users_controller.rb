class UsersController < ApplicationController
  def show
    begin
      requested_messages  = []
      if User.exists?(name: params[:name])
        requested_user = User.where(name: params[:name].downcase).first
        requested_user.messages.each do |message|
          user_messages = {}
          user_messages["message"] = message.message
          user_messages["chatroom"] = message.chatroom.name
          user_messages["created_at"] = message.created_at
          requested_messages.push(user_messages)
        end
        render json: { name: requested_user.name, messages: requested_messages }
      else
        raise ActiveRecord::RecordNotFound
      end
    rescue ActiveRecord::RecordNotFound => error
      render json: { error: error.message }, status: 404
    rescue StandardError => error
      render json: { error: error.message }, status: 422
    end
  end
end
