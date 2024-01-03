class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, limit: 50, null: false
      t.text :description, limit: 500, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.references :organizer, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
