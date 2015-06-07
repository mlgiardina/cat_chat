class MessagesController < ApplicationController

  def index
    messages_object = Message.all
    all_messages = []
    messages_object.each do |message|
      deliverable = {}
      deliverable["user"] = message.user.name
      deliverable["chatroom"] = message.chatroom.name.gsub(/_/,  ' ')
      deliverable["message"] = message.message
      deliverable["created_at"] = message.created_at
      all_messages.push(deliverable)
    end
    render json: all_messages
  end

  def filter_swear_words
    @censored_message = params[:message]
    @censored_message.gsub!(/fuck/, 'censored')
    @censored_message.gsub!(/shit/, 'censored')
    @censored_message.gsub!(/ass\b/, 'censored')
    @censored_message.gsub!(/ass/, 'censored')
    @censored_message.gsub!(/bitch/, 'censored')
  end

  def check_bot_response
    case params[:message]
    when "amiright"
      Message.create(user: User.find_or_create_by(name:"Cat Overlord"), chatroom: Chatroom.find_or_create_by(name: params[:chatroom]), message: "You are never right, human.")
    when "is anyone here?"
      Message.create(user: User.find_or_create_by(name:"Cat Overlord"), chatroom: Chatroom.find_or_create_by(name: params[:chatroom]), message: "I am always here.")
    when "meow"
      Message.create(user: User.find_or_create_by(name:"Cat Overlord"), chatroom: Chatroom.find_or_create_by(name: params[:chatroom]), message: "Hello, brethren.")
    when "woof"
      Message.create(user: User.find_or_create_by(name:"Cat Overlord"), chatroom: Chatroom.find_or_create_by(name: params[:chatroom]), message: "Your kind is not welcome, mutt.")
    when "help"
      Message.create(user: User.find_or_create_by(name:"Cat Overlord"), chatroom: Chatroom.find_or_create_by(name: params[:chatroom]), message: "I refuse.")
    end
  end

  def create
    begin
      filter_swear_words
      new_message = Message.create(
        user_id: User.find_or_create_by(name: params[:user].downcase).id,
        chatroom_id: Chatroom.find_or_create_by(name: params[:chatroom].downcase.parameterize.underscore).id,
        message: @censored_message
        )
      render json: { user: new_message.user.name, chatroom: new_message.chatroom.name.gsub(/_/, ' '), message: new_message.message, created_at: new_message.created_at }
      check_bot_response
    rescue ActiveRecord::RecordNotFound => error
      render json: { error: error.message }, status: 404
    rescue StandardError => error
      render json: { error: error.message }, status: 422
    end
  end

  def get_top_users
    users = []
    User.all.each do |user|
      x = {}
      x["user"] = user.name
      x["message_count"] = user.messages.count
      users.push(x)
    end
    @top_users = users.sort_by { |key| key["message_count"]}.reverse.first(10)
  end

  def get_top_chatroom
    chatrooms = []
    Chatroom.all.each do |chatroom|
      x = {}
      x["name"] = chatroom.name
      x["message_count"] = chatroom.messages.count
      chatrooms.push(x)
    end
    @top_chatroom = chatrooms.sort_by { |key| key["message_count"]}.reverse.first
    @top_chatroom["name"].gsub!(/_/, ' ')
  end

  def get_recent_users
    recent_messages = Message.all.select { |message| message.created_at > (Time.now - 14400) }
    @recent_users = []
    recent_messages.each do |message|
      unless @recent_users.any? {|user| user.id == message.user_id}
        @recent_users.push(message.user)
      end
    @recently_active_users = []
    @recent_users.each { |user| @recently_active_users.push(user.name) }
    end
  end

  def display_stats
    get_top_users
    get_top_chatroom
    get_recent_users
    render json: { topTenUsers: @top_users, mostPopularChatroom: @top_chatroom, recentlyActiveUsers: @recently_active_users }
  end

end
