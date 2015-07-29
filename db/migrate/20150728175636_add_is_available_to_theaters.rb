class AddIsAvailableToTheaters < ActiveRecord::Migration
  def change
    add_column :theaters, :is_available, :boolean
  end
end
