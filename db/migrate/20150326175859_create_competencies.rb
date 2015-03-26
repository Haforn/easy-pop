class CreateCompetencies < ActiveRecord::Migration
  def change
    create_table :competencies do |t|
    	t.integer :title
    	t.integer :expertise
    	t.boolean :added
    	t.integer :points
    	t.integer :user_id
      t.timestamps null: false
    end
  end
end
