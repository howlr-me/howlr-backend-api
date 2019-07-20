class AddClientRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :client, null: false
  end
end
