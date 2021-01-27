class CreateTrainingComments < ActiveRecord::Migration[5.2]
  def change
    create_table :training_comments do |t|
      t.integer :user_id
      t.integer :training_id
      t.text :comment
      t.timestamps
    end
  end
end
