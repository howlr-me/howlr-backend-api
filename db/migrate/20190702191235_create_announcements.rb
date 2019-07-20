class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :details
      t.references :user, null: false
      t.references :client, null: false

      t.timestamps
      t.datetime :discarded_at
    end
    add_index(:announcements, :discarded_at)
  end
end
