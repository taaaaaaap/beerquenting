class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string    :bar_name
      t.text      :address
      t.timestamps
    end
  end
end
