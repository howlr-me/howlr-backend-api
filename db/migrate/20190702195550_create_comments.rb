class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, null: false
      t.references :client, null: false
      t.references :commentable, polymorphic: true, index: true
      t.string :text, null: false, limit: 300

      t.timestamps
      t.datetime :discarded_at
    end
    add_index(:comments, :discarded_at)
  end
end
