class AddUserIdToMessage < ActiveRecord::Migration
  def change
    rename_column(:messages, :user, :user_id)
    rename_column(:messages, :chatroom, :chatroom_id)
  end
end
