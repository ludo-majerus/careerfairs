class CreateSubscriptionDetails < ActiveRecord::Migration
  def change
    create_table :subscription_details do |t|
      t.integer :subscription_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
