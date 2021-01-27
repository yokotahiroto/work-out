class ChangeDataTimeToTrainings < ActiveRecord::Migration[5.2]
  def change
    change_column :trainings, :time, :integer
  end
end
