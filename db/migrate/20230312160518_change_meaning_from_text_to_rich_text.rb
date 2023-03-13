class ChangeMeaningFromTextToRichText < ActiveRecord::Migration[7.0]
  def change
    remove_column :words, :meaning, :text
  end
end
