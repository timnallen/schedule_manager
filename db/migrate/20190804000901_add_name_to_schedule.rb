class AddNameToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :name, :string
  end
end
