class ChangeUpcommingToUpcomingField < ActiveRecord::Migration[7.0]
  def change
    rename_column :words, :upcomming_learn_at, :upcoming_learn_at
  end
end
