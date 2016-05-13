class ChangeUserIdToStringInVote < ActiveRecord::Migration
  def change
    change_column :votes, :user_id, :string
  end
end
