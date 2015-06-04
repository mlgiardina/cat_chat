class MessagesController < ApplicationController

  def index
    render json: Message.all
  end

  def create
    new_message = Message.create(user: params[:user], chatroom: params[:chatroom], message: params[:message])
    render json: new_message
  end

  def show
    render json: Message.find(params[:id])
  end

  def sort
    users = []
    all_messages =  Message.all
    all_messages.each do |message|
      users.push(message.user)
    end
  end

end
