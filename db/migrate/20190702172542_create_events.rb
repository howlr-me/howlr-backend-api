class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :client, null: false
      t.references :user, null: false
      t.string :name, limit: 64
      t.string :location
      t.string :details
      t.datetime :start_date
      t.datetime :end_date
      t.integer :available_places
      t.string :image_url

      t.timestamps
      t.datetime :discarded_at
    end
    add_index(:events, :discarded_at)
  end
end
