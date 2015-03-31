class ChangeExpertiseIntoCompetencyInLogs < ActiveRecord::Migration
  def change
  	add_column :logs, :competency, :string
  	remove_column :logs, :expertise
  end
end
