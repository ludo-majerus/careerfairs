class CreateStands < ActiveRecord::Migration
  def change
    create_table :stands do |t|
      t.integer :companytoevent_id
      t.string :name
      t.string :size

      t.timestamps
    end
  end
end
