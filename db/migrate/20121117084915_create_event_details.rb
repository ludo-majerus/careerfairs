class CreateEventDetails < ActiveRecord::Migration
  def change
    create_table :event_details do |t|
      t.integer :event_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
