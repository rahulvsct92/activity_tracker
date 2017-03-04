class RenameUserIdToCreatorIdInTask < ActiveRecord::Migration[5.0]
  def change
  	rename_column :tasks, :user_id, :creator_id
  end
end
