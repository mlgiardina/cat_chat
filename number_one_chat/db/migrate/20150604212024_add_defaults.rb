class AddDefaults < ActiveRecord::Migration
  def change
    change_column(:messages, :user, :string, null: false)
    change_column(:messages, :chatroom, :string, null: false)
  end
end
