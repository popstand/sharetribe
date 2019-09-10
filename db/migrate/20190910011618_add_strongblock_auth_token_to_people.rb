class AddStrongblockAuthTokenToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :strongblock_auth_token, :string, limit: 30
    add_index :people, :strongblock_auth_token, unique: true
  end
end
