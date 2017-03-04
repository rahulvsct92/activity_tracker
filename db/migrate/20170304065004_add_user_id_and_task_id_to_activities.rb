class AddUserIdAndTaskIdToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :user_id, :integer
    add_index :activities, :user_id
    add_column :activities, :task_id, :integer
    add_index :activities, :task_id
  end
end
