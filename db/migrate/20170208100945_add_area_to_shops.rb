class AddAreaToShops < ActiveRecord::Migration
  def change
    add_column :shops, :area, :text
  end
end
