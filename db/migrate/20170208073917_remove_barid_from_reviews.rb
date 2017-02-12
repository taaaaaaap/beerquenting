class RemoveBaridFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :bar_id, :varchar
  end
end
