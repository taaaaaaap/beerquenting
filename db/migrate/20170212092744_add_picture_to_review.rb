class AddPictureToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :picture, :string
  end
end
