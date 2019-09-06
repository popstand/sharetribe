class AddAuthTokenToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :auth_token, :string, limit: 30
    add_index :people, :auth_token, unique: true
  end
end
