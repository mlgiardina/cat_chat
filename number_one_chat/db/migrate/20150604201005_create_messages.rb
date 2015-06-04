class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :user
      t.string :chatroom
      t.text :message
      t.timestamps null: false
    end
  end
end
