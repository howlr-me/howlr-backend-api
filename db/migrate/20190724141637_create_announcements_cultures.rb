class CreateAnnouncementsCultures < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements_cultures do |t|
      t.references :culture, foreign_key: true
      t.references :announcement, foreign_key: true

      t.timestamps
      t.datetime :discarded_at
    end
    add_index(:announcements_cultures, :discarded_at)
  end
end
