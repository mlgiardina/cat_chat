class MessagesController < ApplicationController

  def index
    render json: Message.all
end
