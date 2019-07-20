class CreateCultures < ActiveRecord::Migration[5.2]
  def change
    create_table :cultures do |t|
      t.string :name, unique: true
      t.references :client, null: false

      t.timestamps
      t.datetime :discarded_at
    end
    add_index(:cultures, :discarded_at)
    add_index(:cultures, [:name, :client_id], unique: true)
  end
end
