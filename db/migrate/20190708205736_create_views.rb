class CreateViews < ActiveRecord::Migration[5.2]
  def change
    create_table :views do |t|
      t.references :user, null: false
      t.references :client, null: false
      t.references :viewable, polymorphic: true, index: true

      t.timestamps
      t.datetime :discarded_at
    end
    add_index(:views, :discarded_at)
  end
end
