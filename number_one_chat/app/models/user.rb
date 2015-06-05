class User < ActiveRecord::Base
  has_many :messages
  belongs_to :chatroom
end
