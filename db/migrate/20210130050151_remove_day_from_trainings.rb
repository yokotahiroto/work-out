class RemoveDayFromTrainings < ActiveRecord::Migration[5.2]
  def change
    remove_column :trainings, :day, :data
  end
end
