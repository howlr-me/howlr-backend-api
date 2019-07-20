class CreateUsersCultures < ActiveRecord::Migration[5.2]
  def change
    create_table :users_cultures do |t|
      t.references :user, null: false
      t.references :culture, null: false

      t.timestamps
      t.datetime :discarded_at
    end
    add_index(:users_cultures, :discarded_at)
  end
end
