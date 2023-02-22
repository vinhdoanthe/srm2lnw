class AddPronunciationToWords < ActiveRecord::Migration[7.0]
  def change
    add_column :words, :pronunciation, :text
  end
end
