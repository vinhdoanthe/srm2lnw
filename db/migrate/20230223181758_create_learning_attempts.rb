class CreateLearningAttempts < ActiveRecord::Migration[7.0]
  def change
    create_table :learning_attempts do |t|
      t.references :word, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :result

      t.timestamps
    end
  end
end
