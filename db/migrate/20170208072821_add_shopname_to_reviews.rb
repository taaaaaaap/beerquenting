class AddShopnameToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :shop_name, :string
  end
end
