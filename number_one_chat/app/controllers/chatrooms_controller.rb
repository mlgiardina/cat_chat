class ChatroomsController < ApplicationController
  def index
    render json: Chatroom.all
  end

  def show
    current_chatroom = Chatroom.where(name: params[:chatroom]).first
    render json: current_chatroom
  end

  # def create
  #   chat_name = params[:name]
  #   if
  #   Chatroom.create(name: params[:name])
end
