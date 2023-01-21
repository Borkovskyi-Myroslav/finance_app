class AddTransactionTypeToOperations < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :transaction_type, :integer, null: false, default: 0
  end
end
