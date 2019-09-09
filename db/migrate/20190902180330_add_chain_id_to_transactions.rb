class AddChainIdToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :chain_id, :string
  end
end
