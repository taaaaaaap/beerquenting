class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    t.string     :user_id
    t.string     :bar_id
    t.string     :usage
    t.text       :liquor_kinds
    t.text       :budget
    t.text       :image
    t.timestamps
    end
  end
end
