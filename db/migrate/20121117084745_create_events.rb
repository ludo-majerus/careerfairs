class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :site_id
      t.date :date
      t.string :hour_begin
      t.string :hour_end
      t.string :location

      t.timestamps
    end
  end
end
