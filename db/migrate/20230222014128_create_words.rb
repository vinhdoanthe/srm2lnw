class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string :word
      t.text :meaning
      t.integer :level_of_difficult

      t.timestamps
    end
  end
end
