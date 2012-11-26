class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :event_id
      t.string :status

      t.timestamps
    end
  end
end
