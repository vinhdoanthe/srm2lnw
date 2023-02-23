class AddFieldsToWord < ActiveRecord::Migration[7.0]
  def change
    add_reference :words, :user, foreign_key: true
    add_column :words, :upcomming_learn_at, :timestamp
    add_column :words, :count_learn_success, :integer
    add_column :words, :count_learn_fail, :integer
    add_column :words, :level_of_mastering, :string
  end
end
