class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :companytoevent_id
      t.string :title

      t.timestamps
    end
  end
end
