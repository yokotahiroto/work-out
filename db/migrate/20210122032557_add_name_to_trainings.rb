class AddNameToTrainings < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :muscle_id, :integer
  end
end
