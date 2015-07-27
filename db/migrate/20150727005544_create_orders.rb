class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :payment_type
      t.boolean :is_canceled

      t.timestamps null: false
    end
  end
end
