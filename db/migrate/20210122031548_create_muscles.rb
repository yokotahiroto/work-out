class CreateMuscles < ActiveRecord::Migration[5.2]
  def change
    create_table :muscles do |t|
      t.integer :part, null: false
      t.timestamps
    end
  end
end
