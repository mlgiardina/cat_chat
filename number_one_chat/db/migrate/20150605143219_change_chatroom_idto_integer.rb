class ChangeChatroomIdtoInteger < ActiveRecord::Migration
  def change
    change_column(:messages, :chatroom_id, :integer, null: false)
    change_column(:messages, :user_id, :integer, null: false)
  end
end
