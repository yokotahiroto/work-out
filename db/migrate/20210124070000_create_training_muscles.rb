class CreateTrainingMuscles < ActiveRecord::Migration[5.2]
  def change
    create_table :training_muscles do |t|
      t.integer :training_id, foreign_key: true
      t.integer :muscle_id, foreign_key: true
      t.timestamps
    end
  end
end
