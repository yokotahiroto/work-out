class RemoveMuscleFromTraining < ActiveRecord::Migration[5.2]
  def change
    remove_column :trainings, :muscle, :integer
  end
end
