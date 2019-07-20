class CreateUsersEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :users_events do |t|
      t.references :user, null: false
      t.references :event, null: false
      t.datetime :discarded_at

      t.timestamps
    end
  end
end
