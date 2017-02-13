class Review < ActiveRecord::Base
  mount_uploader :picture, ImageUploader
  belongs_to :user
  has_many :comments
  belongs_to :shops
end
