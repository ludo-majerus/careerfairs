class CreateCompanytoeventDetails < ActiveRecord::Migration
  def change
    create_table :companytoevent_details do |t|
      t.integer :companytoevent_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
