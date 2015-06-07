class Chatroom < ActiveRecord::Base
  has_many :messages
end
