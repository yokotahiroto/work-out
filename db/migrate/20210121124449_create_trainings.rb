class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.string :user_id
      t.string :post_image_id
      t.date :day
      t.time :time
      t.integer :meal, default: 0, null: false
      t.integer :run, default: 0, null: false
      t.text :memo
      t.integer :weight
      t.timestamps
    end
  end
end
