class CreateLearningGoals < ActiveRecord::Migration
  def change
    create_table :learning_goals do |t|
    	t.string :title
    	t.integer :competency_id
    	t.boolean  :achieved
      t.timestamps null: false
    end
  end
end
