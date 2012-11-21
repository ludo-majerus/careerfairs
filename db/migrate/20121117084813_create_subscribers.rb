class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.integer :event_id
      t.integer :status

      t.timestamps
    end
  end
end
