class ChangeColumnToPart < ActiveRecord::Migration[5.2]
  def change
    change_column :muscles, :part, :string
  end
end
