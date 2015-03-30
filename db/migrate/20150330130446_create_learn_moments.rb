class CreateLearnMoments < ActiveRecord::Migration
  def change
    create_table :learn_moments do |t|
    	t.string   "title"
    	t.text   "what_was_learned"
    	t.text   "what_was_done"
    	t.string   "reference"
    	t.integer  "competency_id"
   		t.integer  "hours"
    	t.string   "image"
      t.timestamps null: false
    end
  end
end
