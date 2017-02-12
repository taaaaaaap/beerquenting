class Review < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  belongs_to :shops
end
