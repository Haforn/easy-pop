class CreateTeamRequests < ActiveRecord::Migration
  def change
    create_table :team_requests do |t|
    	t.integer :user_id
    	t.integer :team_id
      t.timestamps null: false
    end
  end
end
