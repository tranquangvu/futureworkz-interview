class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :vote_type
      t.integer :joke_id, unsigned: true
      t.integer :user_id, unsigned: true
      t.timestamps null: false
    end
  end
end
