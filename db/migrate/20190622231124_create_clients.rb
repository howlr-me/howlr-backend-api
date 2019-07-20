class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name, null: false, unique: true
      t.string :webpage, null: false
      t.integer :number_of_employees, null: false

      t.timestamps
      t.datetime :discarded_at
    end
    add_index(:clients, :discarded_at)
  end
end
