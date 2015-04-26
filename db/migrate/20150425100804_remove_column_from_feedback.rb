class RemoveColumnFromFeedback < ActiveRecord::Migration
  def change
  	remove_column :feedbacks, :title, :string
  end
end
