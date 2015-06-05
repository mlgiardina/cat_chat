class RemovingChatroomIdFromUser < ActiveRecord::Migration
  def change
    remove_column(:users, :chatroom_id)
  end
end
