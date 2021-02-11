class AddStartTimeToTrainings < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :start_time, :datetime
  end
end
