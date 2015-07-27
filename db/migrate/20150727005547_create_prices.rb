class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :type
      t.float :price
      t.date :date_from
      t.date :date_to
      t.boolean :is_confirmed
      t.boolean :is_available

      t.timestamps null: false
    end
  end
end
