class MessagesController < ApplicationController

  def index
    render json: Message.all
  end

  def create
    begin
      render json: Message.create(user: params[:user], chatroom: params[:chatroom], message: params[:message])
    rescue ActiveRecord::RecordNotFound => error
      render json: { error: error.message }, status: 404
    rescue StandardError => error
      render json: { error: error.message }, status: 422
    end
  end

  def show
    begin
      render json: Message.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
      render json: { error: error.message }, status: 404
    rescue StandardError => error
      render json: { error: error.message }, status: 422
    end
  end

end
