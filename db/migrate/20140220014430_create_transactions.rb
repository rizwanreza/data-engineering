class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      %i(purchaser_name description address merchant_name).each do |col|
        t.string col
      end

      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
