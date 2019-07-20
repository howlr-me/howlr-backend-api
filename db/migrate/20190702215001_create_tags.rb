class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.references :client, null: false
      t.string :name
      t.string :bg_color_hex
      t.integer :importance_score

      t.timestamps
      t.datetime :discarded_at
    end
    add_index(:tags, :discarded_at)
  end
end
