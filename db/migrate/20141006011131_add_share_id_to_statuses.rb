class AddShareIdToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :share_id, :integer
  end
end
