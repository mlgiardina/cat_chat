class ChangeChatroomIdtoInteger < ActiveRecord::Migration
  def change
    # change_column(:messages, :chatroom_id, :integer, null: false)
    ALTER TABLE :messages ALTER COLUMN :chatroom_id TYPE :integer;
    # change_column(:messages, :user_id, :integer, null: false)
    ALTER TABLE :messages ALTER COLUMN :user_id TYPE :integer;
  end
end
