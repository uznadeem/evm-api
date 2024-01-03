class CreateJoinTableEventUser < ActiveRecord::Migration[6.0]
  def change
    create_join_table :events, :users do |t|
      t.index [:event_id, :user_id], unique: true
    end
  end
end
