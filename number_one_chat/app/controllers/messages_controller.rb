class MessagesController < ApplicationController

  def index
    render json: Message.all
  end

  def create
    begin
      new_message = Message.create(user: params[:user], chatroom: params[:chatroom], message: params[:message])
      render json: new_message
    rescue
    rescue StandardError => error
      render json { error.message }
  end

  def show
    render json: Message.find(params[:id])
  end

  def sort
    users = []
    messages = []
    chatrooms = []
    all_messages =  Message.all
    all_messages.each do |message|
      users.push(message.user)
      messages.push(message.message)
      chatrooms.push(message.chatroom)
    end
  end

end
