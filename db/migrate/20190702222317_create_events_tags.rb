class CreateEventsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :events_tags do |t|
      t.references :event, null: false
      t.references :tag, null: false

      t.timestamps
      t.datetime :discarded_at
    end
    add_index(:events_tags, :discarded_at)
  end
end
