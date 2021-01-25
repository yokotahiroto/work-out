class RemoveMuscleIdFromTraining < ActiveRecord::Migration[5.2]
  def change
    remove_column :trainings, :muscle_id, :integer
  end
end
