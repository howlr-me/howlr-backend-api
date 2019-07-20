class CreateAnnouncementsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements_tags do |t|
      t.references :announcement, null: false
      t.references :tag, null: false

      t.timestamps
      t.datetime :discarded_at
    end
    add_index(:announcements_tags, :discarded_at)
  end
end
